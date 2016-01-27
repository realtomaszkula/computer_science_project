class Node
  attr_accessor :parent_node, :child_node
  attr_reader :value

  @@instance_collector = []

  def initialize(value, parent_node = nil, child_node = [nil, nil])
    @value = value
    @parent_node  = parent_node
    @child_node = child_node

    @@instance_collector << self
  end

  def self.offspring
    @@instance_collector
  end
end

def build_tree(arr, parent = nil)

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]
  value = right.shift
  value = left.shift if value == nil
  return if value == nil

  node = Node.new(value, parent)
  child1 =  build_tree(left, node.value)
  child2 =  build_tree(right, node.value)

   node.child_node =  if child1 == nil && child2 == nil
                        [nil, nil]
                      elsif child1 == nil
                        [nil, child2.value]
                      elsif child2 == nil
                        [child1.value, nil]
                      else
                         [child1.value, child2.value]
                      end
node
end


arr = [1,2,4,5,6,7,8]
build_tree(arr)

arr = Node.offspring
arr.each do |node|
  puts "value: #{node.value}"
  puts "parent: #{node.parent_node}"
  puts "child: #{node.child_node}"
end


