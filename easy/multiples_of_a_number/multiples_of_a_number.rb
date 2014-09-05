# MULTIPLES OF A NUMBER
# CHALLENGE DESCRIPTION:
#
# Given numbers x and n, where n is a power of 2, print out the smallest multiple of n which is greater than or equal to x. Do not use division or modulo operator.
File.open(ARGV[0]).each_line do |line|
	x, n = line.split(',').map(&:to_i)

	# Shift x log2 of n to take advantage of power of two division
	# Conditionally add n if the multiplier makes the multiple less than x
	multiple = (x >> Math.log2(n)) * n
	multiple = multiple + n if multiple < x

	puts multiple
end