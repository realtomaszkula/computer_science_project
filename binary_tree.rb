class Node
  attr_accessor :parent_node, :child_node, :dup
  attr_reader :value

  def initialize(value, parent_node = nil, child_node = nil, dup = nil)
    @value = value
    @parent_node  = parent_node
    @child_node = child_node
    @dup = dup
  end
end