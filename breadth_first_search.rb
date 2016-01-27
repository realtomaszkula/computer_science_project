require_relative './binary_tree_from_unsorted.rb'

def breadth_first_search(goal , tree)
  queue = []
  visited = [tree.first]
  current = tree.first
  found = false

  loop do
    break if visited.size == tree.size

    if current.value == goal
      found = winning_index(current.value, tree)
      break
    end

    ## visiting and queueing each child node, if found, break the loop
    if current.child[0] != nil
        if current.child[0] == goal
          found = winning_index(current.child[0], tree)
          break
        end
      temp_current = select_from_tree(current.child[0], tree)
      visited << temp_current   unless visited.include?(temp_current)
      queue   << temp_current   unless queue.include?(temp_current)
    end

    if current.child[1] != nil
        if current.child[1] == goal
          found = winning_index(current.child[1], tree)
          break
        end
      temp_current = select_from_tree(current.child[1], tree)
      visited << temp_current   unless visited.include?(temp_current)
      queue   << temp_current   unless queue.include?(temp_current)
    end

    ## moving to the next item in queue
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


arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
Node.build_tree(arr)
tree = Node.tree

puts breadth_first_search(23, tree)

