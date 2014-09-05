# Write a program to read a multiple line text file and write the 'N' longest lines to stdout.
# Where the file to be read is specified on the command line.
import sys

def presult(x):
	print x.strip()

with open(sys.argv[1], 'r') as f:
	lines = f.readlines()
	n = int(lines.pop(0))

	# filter out empty lines
	#filter(lambda l: l.strip() == True, lines)
	lines = [l for l in lines if l.strip()]

	# sort the results on element length
	lines.sort(key=lambda x: len(x.strip()), reverse=True)
	
	# slice off X number of longest lines, print them out
	map(presult, lines[0:n])
