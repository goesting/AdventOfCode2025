grid = File.read("Day07.txt").split.map(&:chars)

beams = []
nextbeams = []
beams << [grid[0].index('S'),1] #[location of beam, number of beams converging in this location]
depth = 0
splits = 0

while depth < grid.size-1
  depth+=1
  row = grid[depth]
  beams.each{|x,cnt|
    if row[x] == '.'
      nextbeams << [x,cnt]
    else
      nextbeams << [x-1,cnt]
      nextbeams << [x+1,cnt]
      splits +=1
    end
  }
  beams = nextbeams.group_by{|a,b| a}.map{|a,b| [a,b.sum{_2}]} #merge beams on the same column
  nextbeams = []
end
puts splits #p1
puts beams.sum{_2} #p2
