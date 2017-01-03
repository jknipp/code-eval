# Given a string comprising just of the characters (,),{,},[,] determine if it is well-formed or not.class Stack

OPEN_CHARS = {"[" => "]", "(" => ")", "{" => "}" }
CLOSE_CHARS = {"]" => "[", ")" => "(", "}" => "{" }

File.open(ARGV[0]).each_line do |line|
  # Use ruby array as a stack
  stack = []
  is_valid = true
  line.strip!

  # short circuit unmatched (odd length) strings
  if line.size == 0 || line.size % 2 != 0
    puts "False"
    next
  end

  line.chars.each do |ch|
    stack.push(ch) if OPEN_CHARS.has_key?(ch)

    if CLOSE_CHARS.has_key?(ch)
      val = stack.pop

      if CLOSE_CHARS[ch] != val
        is_valid = false
        break
      end
    end
  end

  puts (is_valid) ? "True" : "False"
end
