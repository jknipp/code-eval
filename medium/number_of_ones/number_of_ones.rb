# Write a program to determine the number of 1 bits in the internal representation of a given integer.
def ones(num)
	return 0 if num <= 0

	(num & 1) + ones(num >> 1) 
end

File.open(ARGV[0]).each_line do |line|
	puts ones(line.to_i)
end

# First pass
# File.open(ARGV[0]).each_line do |line|
#     num = line.to_i
# 	result = 0

# 	while num > 0
# 		result += num & 1
# 		num = num >> 1
# 	end

# 	puts result
# end