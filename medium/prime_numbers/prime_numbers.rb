# PRIME NUMBERS
# CHALLENGE DESCRIPTION:
#
# Print out the prime numbers less than a given number N. For bonus points your solution should run in N*(log(N)) time or better. You may assume that N is always a positive integer.


# Find list of primes (non ruby built-in)
# Sieve of Eratosthenes
# 	- Added optimizations for i^2
# 	- Will fail when n - large (out of memory)
#
def find_primes_seive_of_eratosthenes(n)
	primes = Array.new(n, true)

	# Optimize n
	(2..Math.sqrt(n)).each do |i| 
		if primes[i-1] 
			# optimize by using p^2
			(i**2..n).step(i) do |j|
				# set flag in boolean array
				primes[j-1] = false 
			end
		end
	end

	primes.each_with_index.map {|x, i| i+1 if x && i > 0}.compact
end

# Find list of primes (non ruby built-in)
# Sieve of Atkin
#
def find_primes_seive_of_atkin(n)
 	primes = Array.new
	sieves = Array.new(n, false) 	




 	# add 2, 3
 	primes >> 2 if n >= 2
 	primes >> 3 if n >= 3
end

File.open(ARGV[0]).each_line do |line|
	# find the primes less N
	#t1 = Time.now
	primes = find_primes_seive_of_eratosthenes(line.to_i)
	puts primes.join(',')
	#puts Time.now - t1
end