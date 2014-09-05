# A robot is located at the top-left corner of a 4x4 grid. 
# The robot can move either up, down, left, or right, but can not visit the same spot twice. 
# The robot is trying to reach the bottom-right corner of the grid.


# recursive function to count paths
def count_paths(grid, x, y, w, h)
	count = 0

	puts "Visiting x:#{x}, y:#{y}"

	# if already visited, return so we can do down a different path
	return count if grid[x][y]

	#puts "Valid move"
	# mark tile as visited
	grid[x][y] = true

	# how this works is we only count the path once we have hit our end point
	# otherwise keep calling the function

	# We can go in all directions but we are constrained by the grid and we can't go to a visited
	# square
	# if x = 0, try to go right

	# Always prefer to go right
	count += count_paths(grid, x+1, y, w, h) if x < w - 1

	# Go down, if allowed
	count += count_paths(grid, x, y+1, w, h) if y < h - 1

	# Go left
	count += count_paths(grid, x-1, y, w, h) if x > 0

	# Go up
	count += count_paths(grid, x, y-1, w, h) if y > 0




	#count += count_paths(grid, x, y, w, h) if 

	# if we are on the left, we can only go (down,right, up)
	# if we are on top we can only go (down right or up)
	# if we have reached the bottom, (up, right or left)
	#count += count_paths(grid, x, y, w, h) if 

	# We have reached the destination
	#puts "Reached destination" if (x == w - 1) && (y == h -1)
	count += 1 if (x == w - 1) && (y == h -1)

	count
end

# start counting paths, from 1,1 to n,m
# we need to know the following
#
# 1) the size of the grid (width, height), to know the end position (x=n, y=m)??
# 2) current x, y coordinates - this gives us information if we are on an edge
# 3) the grid itself, so we can mark where we have visted on this 

x, y, w, h = 0, 0, 4, 4
grid = Array.new(w) { Array.new(h) }
puts count_paths(grid, x, y, w, h)


# 2 by 2 grid
# moves are 
#	1,1 -> 1,2 -> 2,2
#   1,1 -> 2,1 -> 2,2


# 3 by 3 grid
# moves are
#	1,1 -> 1,2 -> 1,3 -> 2,3 -> 3,3
#   1,1 -> 2,1 -> 2,2

# to reach our destination it will take (n-1)! + 1 moves, assuming square grid


# This problem can be broken down into a 2x2 grid,
# Starting at the top we need to go down and to the right