# A number is a self-describing number when (assuming digit positions are labeled 0 to N-1), the digit in each position is equal to the number of times that that digit appears in the number.
# For the curious, here's how 2020 is a self-describing number:
# Position '0' has value 2 and there is two 0 in the number. Position '1' has value 0 because there are not 1's in the number. Position '2' has value 2 and there is two 2. And the position '3' has value 0 and there are zero 3's

File.open(ARGV[0]).each_line do |line|
  values = line.strip.chars.map(&:to_i)

  #puts values.inspect
  buckets = Array.new(values.size, 0)
  values.each_with_index {|v, ndx|
    buckets[v] += 1  if v < values.size
  }

  puts (buckets.join == values.join) ?  1 :  0
end
