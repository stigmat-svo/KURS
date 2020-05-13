re = /^[a-z*\.]+[a-z*]+@[a-z*\.]+[a-z*]/m
str = 'sheludko.vo@gmail.com'

str.scan(re) do |match|
  puts match.to_s
end

