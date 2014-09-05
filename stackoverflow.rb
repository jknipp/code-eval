def hash(str)
  h = 7
  letters = 'acdegilmnoprstuw'
  str.split('').each do |s|
    i = letters.index(s)
    h = (h * 37 + (i ? i : 0))
    puts h
  end
  h
end


#puts hash('leepadg') == 910897038977002

def solver(hash) 
  s = ""
  letters = 'acdegilmnoprstuw'

  while hash > 37
    remainder = hash % 37
    hash = (hash - remainder) / 37
    s = letters[remainder] + s

    puts hash
  end 

  puts "result #{s}"
end

puts solver(680131659347) == 'leepadg'

puts solver(910897038977002) # == 'leepadg'