File.open(ARGV[0]).each_line do |line|
	 str, chars = line.split(',').map(&:strip)
	# use ruby regex built-ins for the magic
	puts str.gsub(/[#{chars}]/, "").strip 
end
