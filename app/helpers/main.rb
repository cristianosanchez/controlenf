require 'date'

puts Date.today()

puts Date.new(2006, 12, -1)


adate = Date.today
puts Date.civil(adate.year, adate.month, -1)



adate = nil
qdata = '2008-11'
#adate = Date.civil(Date.today.year, Date.today.month, 1)

year, month = qdata.split('-')
adate = Date.civil(year.to_i, month.to_i, 1)


puts adate