#!/usr/bin/ruby

n = ARGV[0]

three, five, seven = 'Financial', 'Payments', 'Rules'

(1..n.to_i).each do |v|
	out = []

	out << three if (v % 3 == 0) 
	out << five if (v % 5 == 0)
	out << seven if (v % 7 == 0)

	out << v if out.empty?
	puts out.join(" ")
end
