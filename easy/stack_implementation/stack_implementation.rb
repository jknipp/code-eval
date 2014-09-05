# Write a program implementing a stack inteface for integers.
# The interface should have 'push' and 'pop' functions. You will be asked to 'push' a series of integers and then 'pop' and print out every alternate integer.
class Stack
    def initialize()
      @arr = Array.new
    end

    # We would do crazy push pop stuff if ruby didn't do it for use
    # like re-allocating the array, copying the old array to a new array, etc
    # it would be a pain
    def push(val)
      @arr << val
    end

    def pop
      @arr.pop if @arr.size > 0
    end

    def size
      @arr.size
    end
end


File.open(ARGV[0]).each_line do |line|
  stack = Stack.new
  line.strip.split(' ').each {|v| stack.push(v) }
  vals = Array.new
  i = 0

  while stack.size > 0
    v = stack.pop
    vals.push(v) if i % 2 == 0
    i += 1
  end

  puts vals.join(' ')

end
