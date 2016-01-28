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


    child_l = select_from_tree(current.child[0], tree)
    child_r = select_from_tree(current.child[1], tree)

    ## visiting and queuing the left node first
    if child_l.value != nil && !visited.include?(child_l)
      if child_l.value == goal
          found = winning_index(child_l.value, tree)
          break
      end
      current = child_l
      visited << current   unless visited.include?(current)
      stack   << current   unless stack.include?(current)

    elsif child_r.value != nil && !visited.include?(child_r)
      if  child_r.value == goal
          found = winning_index(child_r.value, tree)
          break
      end
      current = child_r
      visited << current   unless visited.include?(current)
      stack   << current   unless stack.include?(current)
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
  tree.index(node)
end



arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
Node.build_tree(arr)
tree = Node.tree
puts depth_first_search(23, tree)