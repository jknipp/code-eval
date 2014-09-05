# Our marketing department has just negotiated a deal with several local merchants that will 
# allow us to offer exclusive discounts on various products to our top customers every day. 
# The catch is that we can only offer each product to one customer and we may only offer one 
# product to each customer. 
#
# Each day we will get the list of products that are eligible for these special discounts. We 
# then have to decide which products to offer to which of our customers. Fortunately, our 
# team of highly skilled statisticians has developed an amazing mathematical model for 
# determining how likely a given customer is to buy an offered product by calculating what we 
# call the "suitability score" (SS). The top-secret algorithm to calculate the SS between a 
# customer and a product is this: 
#
# 1. If the number of letters in the product's name is even then the SS is the number of vowels (a, e, i, o, u, y) in the customer's name multiplied by 1.5. 
# 2. If the number of letters in the product's name is odd then the SS is the number of consonants in the customer's name. 
# 3. If the number of letters in the product's name shares any common factors (besides 1) with the number of letters in the customer's name then the SS is multiplied by 1.5. 

# Your task is to implement a program that assigns each customer a product to be offered in a 
# way that maximizes the combined total SS across all of the chosen offers. Note that there 
# may be a different number of products and customers. You may include code from external 
# libraries as long as you cite the source.


def vowels(str)
	str.downcase.scan(/[aeiouy]/).size
end

def consonants(str)
	str = str.gsub(/\W+/, '')
	size = str.downcase.scan(/[^aeiouy]/).size
end

def letter_similarity(str1, str2) 
	vowels(str1) == vowels(str2) || consonants(str1) == consonants(str2)
end

def pp(x)
	x.each do |r|
	  puts r.map { |p| p }.join(" ")
	end
end

File.open(ARGV[0]).each_line do |line|
	# Damn ruby is slick!
	# Split the customers and products strings, then separate those into arrays
 	customers, products = line.split(";").map {|x| x.split(",")}
 	#letter_counts = products.map {|v| v.scan(/[a-z]/i).size }

 	matrix = customers.map do |c| 
	 	products.map do |p| 
	 		# We could speed this up by caching product info
	 		lc = p.scan(/[a-z]/i).size
	 		ss = 0

	 		if lc % 2 == 0 
	 			# even
	 			ss = vowels(c) * 1.5
			else
				# odd
				ss = consonants(c)
			end

			# Test 3rd case
			ss *= 1.5 if letter_similarity(c, p)
			ss
		end
	end


 	# Use Munkres algorithm (also called the Hungarian algorithm or the Kuhn-Munkres algorithm)
 	# Also known as assignment problem/transportation problem/min-cost flow
 	# http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=hungarianAlgorithm
 	#
 	# Currently we will find the min value (min-cost)
	puts matrix.inspect

 	# Step 1, find minimal outgoing edge and subtract its weights from all weights connected to vertex
 	# For each element of each row in the matrix, subtract the minimum value of the row
	step1 = matrix.map do |row| 
		min = row.min
		puts "Row #{row}"
		puts "RowMin #{min}"
		row.map do |val|
			puts "Val #{val}"
			val -= min 
		end
	end

	puts "------------------Step 1 -----------------"
	puts step1.inspect

	# Step 2 - subtract minimal column value from each value
	step1 = step1.transpose
	step2 = step1.map do |row| 
		min = row.min

		row.map do |val|
			val -= min 
		end
	end

	puts "------------------Step 2 -----------------"
	step2 = step2.transpose
	puts step2.transpose.inspect

	# Step 3 - Cover each column containing a starred zero
	# if K columns are covered, the starred zeros describe a 
end

