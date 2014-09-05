# BEAUTIFUL STRINGS
# CHALLENGE DESCRIPTION:
#
# Credits: This problem appeared in the Facebook Hacker Cup 2013 Hackathon. 
#
# When John was a little kid he didn't have much to do. There was no internet, no Facebook, and no programs to hack on. So he did the only thing he could... he evaluated the beauty of strings in a quest to discover the most beautiful string in the world. 
#
# Given a string s, little Johnny defined the beauty of the string as the sum of the beauty of the letters in it. The beauty of each letter is an integer between 1 and 26, inclusive, and no two letters have the same beauty. Johnny doesn't care about whether letters are uppercase or lowercase, so that doesn't affect the beauty of a letter. (Uppercase 'F' is exactly as beautiful as lowercase 'f', for example.) 

# You're a student writing a report on the youth of this famous hacker. You found the string that Johnny considered most beautiful. What is the maximum possible beauty of this string?
File.open(ARGV[0]).each_line do |line|
	# to lower case, remove non Alpha chars
	bs = line.downcase.gsub!(/[^a-z]/,'')

	# This feels like cheating - group by for frequencies, then sort, reverse
	chars = bs.chars.group_by{|v| v}.sort_by{|v| v[1].size}.reverse
	
	# Start at 27 since ruby does not have post decrementer
	val = 27
	lookup_table = Hash[chars.map {|v| [v[0], val-= 1] }]
	puts bs.chars.inject(0) { |sum, c| sum + lookup_table[c] }

end
 
# Original working solution

 # 	# to lower case, remove non Alpha chars
	# bs = line.downcase.gsub!(/[^a-zA-Z]+/,'')
	
	# next if bs.nil? || bs.empty?
	# #puts bs
	# # Create a hash of letters, for each letter we need to store the count and its value
	# # We could really cheat and only care about the characters in the supplied string
	# # This feels like cheating - group by then sort, assign letter a value in descending frequency order
	# Create a hash with default values
	# lookup_table = Hash.new { |h, k| h[k] }


	# # count frequencies of letters in string
	# chars = bs.split('')
	# chars.each {|s| lookup_table[s] += 1 if lookup_table.has_key?(s)}

	# # sort by frequency, assign values descending from 26
	# lookup_table = lookup_table.sort_by{|k, v| v}.reverse
	# #puts lookup_table.inspect

	# # create hash from sorted values
	# val = 27
	# lookup_table = Hash[lookup_table.map {|v| [v[0], val-= 1] }]
	# #puts lookup_table
	# puts chars.inject(0) { |sum, c| sum + lookup_table[c] }