if File.exist?(ARGV[0])

	File.open(ARGV[0]).each_line do |line|
		input = line.split

		if input && input.length == 3
			a, b, n = input[0].to_i, input[1].to_i, input[2].to_i
			next unless (a.between?(1,20) && b.between?(1,20) && n.between?(21,100))

			(1..n).each do |v|
				print v if (v % a != 0) && (v % b != 0)
				print 'F' if (v % a == 0) 
				print 'B' if (v % b == 0)
				print ' ' if v < n
			end

			print "\n"
		end
	end
end