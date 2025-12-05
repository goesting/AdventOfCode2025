ranges,ingredients = File.read("Day05.txt").split("\n\n")
ranges = ranges.split.map{|line| line.split('-').map(&:to_i)}.map{|a,b| (a..b)}
ingredients = ingredients.split.map &:to_i

#part1 just count them
puts ingredients.count{|ing| ranges.any?{|r| r.cover?(ing)}}

#part2
lvl = result = 0
range_start = range_end = -1

ranges.map{|rng| [[rng.min,-1],[rng.max,1]]}.flatten(1).sort.each{|val,status| 
  
  range_start = val                       if lvl == 0 and status == -1
  result += (range_end=val)-range_start+1 if (lvl+=status) == 0

}
puts result
