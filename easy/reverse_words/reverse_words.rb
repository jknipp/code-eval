if File.exist?(ARGV[0])
	File.open(ARGV[0]).each_line do |line|
		input = line.split

		if input && input.length > 1
			puts input.reverse.join(" ")
		end
	end
end