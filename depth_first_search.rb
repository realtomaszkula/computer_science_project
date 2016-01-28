require_relative './binary_tree_from_unsorted.rb'

def depth_first_search(goal, tree)

current = tree.first
stack = [tree.first]
visited = [tree.first]

loop do
    break if visited.size == tree.size

    if current.value == goal
      found = winning_index(current.value, tree)
      break
    end
    p stack

    ## visiting and queuing the left node first
    if current.child[0] != nil
      if current.child[0] == goal
          found = winning_index(current.child[0], tree)
          break
      end
      temp_current = select_from_tree(current.child[0], tree)
      visited << temp_current   unless visited.include?(temp_current)
      stack   << temp_current   unless stack.include?(temp_current)

    elsif current.child[1] != nil
      if current.child[1] == goal
          found = winning_index(current.child[0], tree)
          break
      end
      temp_current = select_from_tree(current.child[0], tree)
      visited << temp_current   unless visited.include?(temp_current)
      stack   << temp_current   unless stack.include?(temp_current)
    else
      current = stack.pop

    end

    ## running into the dead end we go back

  end
end

def select_from_tree(what, tree)
  tree.select { |node| node.value == what }.first
end

def winning_index(value, tree)
  node = select_from_tree(value, tree)
  tree.index(node)
end



arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
Node.build_tree(arr)
tree = Node.tree
p tree
puts depth_first_search(23, tree)