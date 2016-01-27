class Node
  attr_accessor :parent, :child, :dup
  attr_reader :value, :tree

  @@tree = []

  def initialize(value, parent = nil, child = [nil, nil], dup = 0)
    @value = value
    @parent = parent
    @child = child
    @dup = 0
  end

  def self.tree
    @@tree
  end

  def self.build_tree(arr)
    while arr.length > 0
      new_node = Node.new(arr.shift)
      dup = false

      for i in 0..(@@tree.length - 1)
        if @@tree[i].value == new_node.value
          @@tree[i].dup += 1
          dup = true
        elsif @@tree[i].value < new_node.value && @@tree[i].child[1] == nil
          @@tree[i].child[1] = new_node.value
          new_node.parent = @@tree[i].value
        elsif @@tree[i].value > new_node.value && @@tree[i].child[0] == nil
          @@tree[i].child[0] = new_node.value
          new_node.parent = @@tree[i].value
        else
          next
        end
      end
    @@tree << new_node unless dup
    end
  end
end


# arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# Node.build_tree(arr)
# tree =  Node.tree

# tree.each { |node|
#   puts "value: #{node.value}"
#   puts "dup: #{node.dup}"
#   puts "parent: #{node.parent}"
#   puts "child: #{node.child}"
# }




