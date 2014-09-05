# The problem is as follows: choose a number, reverse its digits and add it to the original. 
# If the sum is not a palindrome (which means, it is not the same number from left to right and right to left), 
# repeat this procedure. E.g.
#
# 	195 (initial number) + 591 (reverse of initial number) = 786
#
# 	786 + 687 = 1473
#
# 	1473 + 3741 = 5214
#
# 	5214 + 4125 = 9339 (palindrome)
# In this particular case the palindrome 9339 appeared after the 4th addition. 
# This method leads to palindromes in a few step for almost all of the integers. 
# But there are interesting exceptions. 196 is the first number for which no palindrome has been found.
# It is not proven though, that there is no such a palindrome.

def is_palindrome?(i, num)
	# exit just in case the test gets crazy
	return i, num if i > 100 

	result = num + num.to_s.reverse.to_i

	if result == result.to_s.reverse.to_i
		return i, result
	else 
		# call again
		return is_palindrome?(i+1, result)
	end
end

File.open(ARGV[0]).each_line do |line|
	i, result = is_palindrome?(1, line.to_i)
	puts "#{i} #{result}"
end
