# Write a program to read a multiple line text file and write the 'N' longest lines to stdout. 
# Where the file to be read is specified on the command line.
File.open(ARGV[0]).each_line do |line|
	puts ones(line.to_i)
end

