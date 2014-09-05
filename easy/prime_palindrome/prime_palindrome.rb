
# Find list of primes (non ruby built-in)
# Sieve of Eratosthenes
#
def find_primes(n)
	numbers = Array.new(n)

	(2..n).each do |i| 
		(2*i..n).step(i) do |j|
			# set flag in boolean array
			numbers[j-1] = 1  if j % i == 0
		end
	end

	numbers.each_with_index.map {|x, i| i+1 if x.nil? && i > 0}.compact
end

# Do some math to determin if the number is 
# a palindrome
def is_palindrome(n) 
	x = n
	rev = 0

	while x > 0
		dig = x % 10
		rev = rev * 10 + dig
		x = x / 10
	end

	n == rev
end

# find the primes less N
primes = find_primes(1000)

# find largest one that is palindrome, i.e. same forward and backwards
#puts primes.reverse.inspect

primes.reverse.each do |p|
	if is_palindrome(p)
		puts p
		break
	end
end
