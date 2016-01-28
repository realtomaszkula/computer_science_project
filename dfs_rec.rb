require_relative './binary_tree_from_unsorted.rb'

def depth_first_search(goal, tree, current = tree.first, visited = [tree.first] )

    return false if visited.size == tree.size

    if current.value == goal
      found = winning_index(current.value, tree)
      return found
    end

    child_l = select_from_tree(current.child[0], tree)
    child_r = select_from_tree(current.child[1], tree)

    ## visiting and queuing the left node first
    if child_l != nil && !visited.include?(child_l)
      if child_l.value == goal
          found = winning_index(child_l.value, tree)
          return found
      end
      current = child_l
      visited << current

      depth_first_search( goal, tree, current, visited )

    ## if you can't go left, try right
    elsif child_r != nil && !visited.include?(child_r)
      if  child_r.value == goal
          found = winning_index(child_r.value, tree)
          return found
      end
      current = child_r
      visited << current

      depth_first_search( goal, tree, current, visited )
    ## running into the dead end we go back
    else
      return false
    end

end

def select_from_tree(what, tree)
  tree.select { |node| node.value == what }.first
end

def winning_index(value, tree)
  puts "winning"
  node = select_from_tree(value, tree)
  tree.index(node)
end



arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
Node.build_tree(arr)
tree = Node.tree

# tree.each { |node|
#   puts "\t\tvalue: #{node.value}"
#   puts "dup: #{node.dup}"
#   puts "parent: #{node.parent}"
#   puts "child: #{node.child}"
# }


p depth_first_search(444, tree)