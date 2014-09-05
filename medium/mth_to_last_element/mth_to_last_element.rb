# Write a program to determine the Mth to last element of a list. 
File.open(ARGV[0]).each_line do |line|
	chars = line.split

	# last char is the 1 based index
	if chars && chars.length > 0
		ndx = chars.pop.to_i
		puts chars[chars.length - ndx] unless ndx > chars.length
	end
end
