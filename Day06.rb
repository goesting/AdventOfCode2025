#part 1
input = File.read("Day06.txt").split("\n").map{|line| line.split}.transpose
puts input.sum{|line| line[..-2].map(&:to_i).inject(line[-1].to_sym)}

#part 2
input = File.read("Day06.txt").split("\n").map{|line| line.chars}.transpose
result = []
nrs = []
operation = nil

input.each{|line| 
  operation = line[-1].to_sym unless line[-1] == " "
  nr = line[..-2].join.to_i
  if nr == 0
    result << nrs.inject(operation)
    nrs = []
  else  
    nrs << nr
  end
}
result << nrs.inject(operation)
puts result.sum
