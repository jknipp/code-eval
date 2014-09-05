# working_experience.rb
#
# You're building a new social platform and you want to store user's working experience. 
# You've decided to calculate the total experience in years for each user based on the time periods 
# entered by users. Using this approach you need to be sure that you're taking into account overlapping
# time periods in order to retrieve an actual working experience in years. E.g. 
# Jan 2010-Dec 2010 
# Jan 2010-Dec 2010 
# Two jobs with 12 months of experience each, but the actual work experience is 1 year, 
# because of overlapping time periods. The challenge is to calculate the actual working experience based
# on the list of time intervals.
#
# INPUT SAMPLE:
#
# Your program should accept as its first argument a path to a filename. Each line of the file 
# contains a list of time periods separated by a semicolon with and a single whitespace.
# Each period is represented by begin date and end date. Each date consists of a month as an 
# abbreviated name and a year with century as a decimal number separated by a single white space. 
# The begin and end dates are separated by dash ("-"). E.g.

# Constraints: 
# 	The number of line in a file is in range [20, 40] 
# 	The dates are in range [Jan 1990, Dec 2020] 
#   The end date > begin date. 
# Assume that the day of begin date is the first day of given month and the day of the end date is the last day of a given month.

require 'date'

class Employment
	attr_accessor :start_date
	attr_accessor :end_date

	def initialize(start_date, end_date)
		# Start Date = First day of month 
		@start_date	= Date.parse(start_date)

		# End Date = Last day of month 
		@end_date = Date.parse(end_date).next_month.prev_day
	end

	def valid?
		start_date >= Date.new(1990, 1,1) && end_date <= Date.new(2020, 12, -1) && end_date > start_date
	end

	def to_s
		"#{start_date} - #{end_date}"
	end
end


File.open(ARGV[0]).each_line do |line|
	next unless line.strip.length > 0

	jobs = line.split(";")
	next unless jobs.length > 0 

	# Group the dates into employment objects and sort
	employment = jobs.map {|x| x.strip.split("-")}.collect {|d| Employment.new(d[0], d[1])}.sort_by{|d| d.start_date}
	next unless employment.length > 0

	#puts employment.to_s
	
	# Calculating overlap
	days = 0
	employment.each_with_index do |e, i|
		next if !e.valid?

		sd1, ed1 = e.start_date, e.end_date

		if i > 0
			sd0, ed0 = employment[i-1].start_date, employment[i-1].end_date

			if sd0 <= sd1 && ed0 >= sd1
				if ed1 > ed0
					days = days + (ed1 - ed0);
				end
				next;
			end
		end
		days = days + (ed1 - sd1)
	end

	#puts days
	puts (days / 365).floor

	#if start date,  sd0 <= sd1 <= ed0
	# 	overlap potentially
	# 	if ed1 > ed0
	# 		months = ed1 - ed0
	#   else 
	#   	# don't add months, we have already counted them
end
