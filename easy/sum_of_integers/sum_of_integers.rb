if File.exist?(ARGV[0])

	sum = 0
	File.open(ARGV[0]).each_line { |l| sum = sum + l.to_i }
	puts sum

end