class Node
  attr_accessor :parent_node, :child_node
  attr_reader :value

  @@instance_collector = []


  def initialize(value, parent_node = nil, child_node = [nil, nil])
    @value = value
    @parent_node  = parent_node
    @child_node = child_node

    @@instance_collector << self if @value != nil
  end

  def self.offspring
    @@instance_collector
  end

end

def build_tree(arr, parent = nil)

mid = arr.length / 2
left = arr[0..mid]
right = arr[mid..-1]
value = right.shift


return if value == nil
return nil if left.size ==  0 || right.size == 0

node = Node.new(value, parent)
node.child_node = [ Node.new(build_tree(left), node), Node.new(build_tree(right), node) ]

node
end


arr = [1,2,4,5,6,7,8]
build_tree(arr)

puts arr = Node.offspring.size
# arr.each do |node|
#   puts "value: #{node.value}"
#   puts "parent: #{node.parent_node}"
#   puts "child: #{node.child_node}"
# end


