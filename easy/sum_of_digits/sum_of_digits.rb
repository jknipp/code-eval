# SUM OF DIGITS
# CHALLENGE DESCRIPTION:
#
# Given a positive integer, find the sum of its constituent digits.

# Use recursion
def sum_digits(n) 
	sum = 0
	if n > 0
		sum = n % 10
		#puts "sum: #{sum}, #{n}"
		return sum + sum_digits(n /= 10) 
	end

	sum
end

File.open(ARGV[0]).each_line do |line|
	# Recursively add digits without iterating over the string
	puts sum_digits(line.to_i)

	# Non-recursive without array
	sum = 0
	n = line.to_i
	while n > 0
		sum += n % 10
		n /= 10
	end

	puts sum

	# Split into array, sum elements of the array
	puts line.split('').inject(0) { |sum, i| sum + i.to_i }
end
