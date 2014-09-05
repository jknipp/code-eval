if File.exist?(ARGV[0])
	File.open(ARGV[0]).each_line do |line|
		line.strip! if line && line.length > 0
		line.downcase!
		
		chars = { '0' => 0, '1' => 1, '2' => 2, '3' => 3,
				  '4' => 4, '5' => 5, '6' => 6, '7' => 7,
				  '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
				  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
				}


		# Easy way
		#puts line.to_i(16).to_s(10) if line && line.length > 0

		# harder way
		arr = line.chars.to_a #scan(/\w/)
		sum = 0
		for i in 0..(arr.length)
			dec_val = chars[arr[i]]

			if dec_val
				sum += (dec_val * (16 ** (arr.length - i -1)))
			end
		end

		puts sum
	end
end