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

tree.each { |node|
  puts "value: #{node.value}"
  puts "dup: #{node.dup}"
  puts "parent: #{node.parent}"
  puts "child: #{node.child}"
}


breadth_first_search(67, tree)

def breadth_first_search(goal , tree)

  found = nil
  current = tree.first
  queue = [current]

  loop do
    break if found || queue == []
    queue << current.child[0] if current.child[0] != nil
    queue << current.child[0] if current.child[0] != nil

    current = tree.select { |node| node.value == queue.shift }
    found = tree.index(current.value) if current.value == goal
  end





