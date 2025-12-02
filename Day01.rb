input = File.readlines("Day01.txt").map{|line| line[0]=='R' ? line[1..].chomp.to_i : -line[1..].chomp.to_i}

dial_position = 50
DIAL_SIZE     = 100

#Part1
puts input.map{|x| (dial_position += x) % DIAL_SIZE}.count(0)

#Part2
dial_position = 50
puts ([dial_position] + input.map{|x| (dial_position += x)}).each_cons(2).sum{|a,b| low,high=[a,b].minmax; (high+1).ceildiv(DIAL_SIZE) - low.ceildiv(DIAL_SIZE) - (a%100 == 0 ? 1 : 0) }
