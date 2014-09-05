if File.exist?(ARGV[0])
	File.open(ARGV[0]).each_line do |line|
		n, p1, p2 = line.split(",").map(&:to_i)
		b1, b2 = [p1, p2].map {|v| (n >> v - 1) & 1}
		puts b1 == b2 
	end
end
