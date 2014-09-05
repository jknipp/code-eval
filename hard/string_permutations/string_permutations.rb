# STRING PERMUTATIONS
# CHALLENGE DESCRIPTION:
#
# Write a program to print out all the permutations of a string in alphabetical order. 
# We consider that digits < upper case letters < lower case letters. 
# The sorting should be performed in ascending order.

# Generate permutations of each string 
# Takes the an array, original string, starting index, ending index
#
class Mutate 

	def permutate(str, i, n)
		@count ||= 0

		# At the end of the array, add the permutation
		if i == n
			print (@count > 0) ? ",#{str}" : str
			@count += 1
			#@result << str
		else
			j = i
			for j in j..n-1
				# swap i and j
				str = swap(str, i, j)
				permutate(str, i+1, n)
				#swap back
				str = swap(str, j, i)
			end
		end
	end

	def swap(str, i, j) 
		tmp = str[i]
		str[i] = str[j]
		str[j] = tmp

		str
	end

	def permutations
		return @result
	end 
end

File.open(ARGV[0]).each_line do |line|

	# Generate permutations
	arr = Array.new

	# Cheat on the ordering, do it up front with ruby built-in's
	l = line.strip.split("").sort.join
	m = Mutate.new
	m.permutate(l, 0, 3)
	puts
	
	#puts m.permutations.inspect
end

# jknipp - rudimentary way, we can do better since order doesn't matter
# Find combinations
# Sort them
# Print them


