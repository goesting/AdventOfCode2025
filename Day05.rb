ranges,ingredients = File.read("Day05.txt").split("\n\n")
ranges = ranges.split.map{|line| line.split('-').map(&:to_i)}.map{|a,b| (a..b)}
ingredients = ingredients.split.map &:to_i

#part1 just count them
puts ingredients.count{|ing| ranges.any?{|r| r.cover?(ing)}}

#part2
lvl = 0
result = 0
range_start = range_end = -1
#LVL: Keep track of the amount of ranges that are currently covering the same piece
#     -1 for each extra layer of overlap, +1 whenever one closes
#      done this way to make sorting easier
#range_start: beginning of this overlap range
#range_end: gets set when all overlaps stop (lvl resets to 0)
#result: when all overlaps are done(lvl is back to 0), add the total size of overlapping ranges

ranges.map{|rng| [[rng.min,-1],[rng.max,1]]}.flatten(1).sort.each{|val,status| 
  
  range_start = val                       if lvl == 0 and status == -1
  result += (range_end=val)-range_start+1 if (lvl+=status) == 0

}
puts result
