def ways_to(from, to, connections, path)
  return 733 unless connections.key? from
  return 0 if path.count(from) > 1
  return 1 if connections[from].include?('out')
  return connections[from].sum{|outflow| path = path + [outflow]; ways_to(outflow, to, connections, path)}
end
def ways_to_out2(from, connections,path)
  if connections[from].include?('out')
    if path.include?('dac') && path.include?('fft')
      return 1
    else
      return 0
    end
  end
  return connections[from].sum{|outflow| 
    path = path + [outflow]
    ways_to_out2(outflow,connections,path)}
end
input = File.read("Day11.txt").split("\n").map{|line| line.split(': ')}.map{|a,b| [a,b.split]}.to_h

#part1
puts ways_to('you', 'out', input, ['you'])

#part2
from = 'dac'
to = 'fft'
puts ways_to(from, to, input, [from])
from = 'fft'
to = 'out'
puts ways_to(from, to, input, [from])
