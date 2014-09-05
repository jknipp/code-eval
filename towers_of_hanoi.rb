class HanoiTower
	attr_accessor :counter

	def initialize
		@counter = 0
		@tree = []
	end

	# recursive solution
	def solve(n, src, dest, spare)
		puts "MoveTower(#{n}, #{src[0]}, #{dest[0]}, #{spare[0]})"
		if n == 1
			# move disk from source to dest
			move_disk(src, dest)
		else 
			# Move pegs from A to C
			solve(n-1, src, spare, dest)

			# move disk from source to dest
			move_disk(src, dest)

			# Move pegs from C to b
			solve(n-1, spare, dest, src)
		end
	end 

	def move_disk(src, dest)
		@counter += 1
		
		disk = src[1].pop()
		puts "Moving #{disk} #{src[0]} -> #{dest[0]})"

		dest[1].push(disk)
	end

end

# Pegs
n = 3
A, B, C = Array.new, Array.new, Array.new
a, b, c = ['A', A], ['B', B], ['C', C]

# Populate first peg order disk size largest to smallest
n.downto(1) {|i| A.push(i)}

#puts A.inspect
ht = HanoiTower.new
ht.solve(n, a, b, c)
puts A.inspect
puts B.inspect
puts C.inspect	
puts "# of moves #{ht.counter}"
