class Node
  attr_accessor :parent, :child, :dup
  attr_reader :value

  @@instance_collector = []

  def initialize(value, parent = nil, child = [nil, nil], dup = 0)
    @value = value
    @parent  = parent
    @child = child
    @dup = 0
  end

end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = []

while arr.length > 1
  new_node = Node.new(arr.shift)
  dup = false

  for i in 0..(tree.length - 1)
    if tree[i].value == new_node.value
      tree[i].dup += 1
      dup = true
    elsif tree[i].value < new_node.value && tree[i].child[1] == nil
      tree[i].child[1] = new_node.value
      new_node.parent = tree[i].value
    elsif tree[i].value > new_node.value && tree[i].child[0] == nil
      tree[i].child[0] = new_node.value
      new_node.parent = tree[i].value
    else
      next
    end
  end

  tree << new_node unless dup
end

# tree.each { |node|
#   puts "value: #{node.value}"
#   puts "dup: #{node.dup}"
#   puts "parent: #{node.parent}"
#   puts "child: #{node.child}"
# }

def breadth_first_search(goal , tree)
  found = false
  current = tree.first
  queue = [current.value]

  loop do
    break if found != false || queue.size == 0
    if current.value == goal
      node = tree.select { |node| node.value == current.value }.first
      found = tree.index(node)
    end
    queue << tree.select { |node| node.value == current.child[0] }.map { |x| x.value }.first if current.child[0] != nil
    queue << tree.select { |node| node.value == current.child[1] }.map { |x| x.value }.first if current.child[1] != nil

    p queue
    first_in_line = queue.shift
    current = tree.select { |node| node.value == first_in_line }.first
  end
  found
end

x = breadth_first_search(67, tree)

puts x