input = File.read("Day02.txt").split(',').map{|g| g.split('-')}

#part1
puts input.sum{|low,high| (low..high).sum{|x|m=x.size>>1; (x.size % 2 == 0 && x[0,m] == x[m,m]) ? x.to_i : 0 }}

#part2
puts input.sum{|low,high| (low..high).sum{|x| (x =~ /^(.+)\1+$/).nil? ? 0 : x.to_i}}.inspect
