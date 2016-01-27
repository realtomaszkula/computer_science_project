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