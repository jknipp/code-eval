File.open(ARGV[0]).each_line do |line|
	input = line.split(",")

	if input && input.length > 1
		str, needle = input[0].strip, input[1].strip

		# use ruby regex built-ins for the magic
		if /^*#{needle}$/.match(str)
			puts 1
		else
			puts 0
		end		
	end
end
