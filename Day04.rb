#Method to return array of all rolls with <4 neighbour rolls
def accessible_rolls(grid, rows, cols, offsets)
  to_remove = []
  grid.each_index{|y| grid[y].each_index{|x|
  neighbours = 0
  next if grid[y][x] == '.'
  neighbours = offsets.count{|dy,dx|(0...rows).cover?(y+dy) && (0...cols).cover?(x+dx) && grid[y+dy][x+dx] == '@'}
  to_remove << [y,x] if neighbours < 4
}}
to_remove
end

#LOAD INPUT
grid = File.read("Day04.txt").split("\n").map{|line| line.chars}

#SET VARIABLES
offsets = [-1,0,1].product([-1,0,1]).reject{|dy,dx|dx==0 && dy==0}
rows = grid.size
cols = grid[0].size

#PART1
to_remove = accessible_rolls(grid, rows, cols, offsets)
puts to_remove.size

#PART2
total_rolls_removed = 0
while !to_remove.empty?
  to_remove = accessible_rolls(grid, rows, cols, offsets)
  total_rolls_removed += to_remove.size
  to_remove.each{|y,x| grid[y][x] = '.'}
end
puts total_rolls_removed
