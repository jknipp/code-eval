# Challenge Description
#
# Imagine we have an immutable array of size N which we know to be filled with integers ranging
# from 0 to N-2, inclusive. Suppose we know that the array contains exactly one duplicated entry
# and that duplicate appears exactly twice. Find the duplicated entry. 
# (For bonus points, ensure your solution has constant space and time proportional to N)

File.open(ARGV[0]).each_line do |line|
 	size, numbers = line.split(';').map { |x| x.split(',') }

 	# idea 1 - convert array to map, check on each insertion if the key exists
 	# only iterate the list once


 	# idea 2 - create an array of N-2, set bit values the index represented by N
 	# essentially this is a bit array of N-2 length "01000"
 	bit_array = Array.new(size[0].to_i)
 	numbers.each do|n| 
 		if bit_array[n.to_i] & 1 
 			puts n
 			break
		end

 		bit_array[n.to_i] |= 1
 	end
end

