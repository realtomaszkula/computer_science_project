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

while arr.length > 0
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

  queue = []
  visited = [tree.first]
  current = tree.first
  found = nil

  loop do

    if current.value == goal
      found = winning_index(current.value, tree)
      break
    end
    if visited.size == tree.size
      found = false
      break
    end

    if current.child[0] != nil
        if current.child[0] == goal
          found = winning_index(current.child[0], tree)
          break
        end
      temp_current = select_from_tree(current.child[0], tree)
      visited << temp_current unless visited.include?(temp_current)
      queue << temp_current unless queue.include?(temp_current)
    end
    if current.child[1] != nil
        if current.child[1] == goal
          found = winning_index(current.child[1], tree)
          break
        end
      temp_current = select_from_tree(current.child[1], tree)
      visited << temp_current unless visited.include?(temp_current)
      queue << temp_current unless queue.include?(temp_current)
    end
    current = queue.shift
  end
found
end

def select_from_tree(what, tree)
  tree.select { |node| node.value == what }.first
end

def winning_index(value, tree)
  node = select_from_tree(value, tree)
  tree.index(node)
end


puts breadth_first_search(324, tree)
