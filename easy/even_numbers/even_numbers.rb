 # Write a program which checks input numbers and determines whether a number is even or not. 
File.open(ARGV[0]).each_line do |line|
 	puts (line.to_i & 1 == 1) ? 0 : 1
 end