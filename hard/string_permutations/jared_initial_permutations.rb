def permutate(arr, str, i, j)
	#['h', 'a', 't']
	copy = str.dup

	# First time 0, 0
	# Inner loop 1, 1
	# 1,2 
	# Second time 0,1

	# Third time
	# Move 2 to 0

	for i in 0..str.size do  
		# swap char at i with first element
		copy = swap(copy, i, str.size - j)
		puts copy

		if i < copy.size - 1
			arr << permutate(arr, str, i+1, j)
		else 
			arr << copy
			# swap last two chars
			swap = copy[i]
			copy[i] = copy[i+1]
			copy[i+1] = swap
			arr << copy
		end
	end


end