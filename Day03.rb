bank = File.read("Day03.txt").split.map{|line| line.chars.map(&:to_i)}
#part1
puts bank.sum{|line| 
  digit_1 = line[..-2].max
  index_1 = line.index(digit_1)
  digit_2 = line[index_1+1..].max
  10*digit_1+digit_2
}

#part2
puts bank.sum{|line|
  prev_index = -1
  res = 0
  12.times{|i|
    best_digit = line[prev_index+1..(-12+i)].max
    prev_index = line[prev_index+1..(-12+i)].index(best_digit) + prev_index + 1
    res = res*10 + best_digit
  }
  res
}
