File.open(ARGV[0]).each_line do |line|
	#puts line.downcase
 	puts line.chars.map { |c| ('A' <= c && c <= 'Z') ? (c.ord+32).chr : c }.join
end
