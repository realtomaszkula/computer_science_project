class Node
  attr_accessor :parent, :child, :dup
  attr_reader :value

  @@instance_collector = []

  def initialize(value, parent_node = nil, child_node = [nil, nil], dup = 0)
    @value = value
    @parent  = parent_node
    @child = child_node
    @dup = 0
  end

end


arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = []

while arr.length > 1
  new_value = arr.shift
  new_node = Node.new(new_value)

  p new_value
  dup = false

  for i in 0..(tree.length - 1)
    if tree[i].value == new_node.value
      tree[i].dup += 1
      dup = true
    elsif tree[i].value < new_value && tree[i].child[1] == nil
      tree[i].child[1] = new_node.value
      new_node.parent = tree[i].value
    elsif tree[i].value < new_value && tree[i].child[1] != nil
      next
    elsif tree[i].value > new_value && tree[i].child[0] == nil
      tree[i].child[0] = new_node.value
      new_node.parent = tree[i].value
    elsif tree[i].value > new_value && tree[i].child[0] == nil
      next
    end
  end

  tree << new_node unless dup
end

puts tree.each { |node|
  puts "value: #{node.value}"
  puts "dup: #{node.dup}"
  puts "parent: #{node.parent}"
  puts "child: #{node.child}"
}


