def area(rect1, rect2)
  (rect1[0]-rect2[0]+1).abs * (rect1[1] - rect2[1]+1)
end

input = File.read("Day09.txt").split.map{|line| line.split(',').map(&:to_i)}
puts input.combination(2).map{|a,b| area(a,b)}.max
