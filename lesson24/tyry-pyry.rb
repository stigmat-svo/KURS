(1..100).each do |num|
  if (num % 15).zero?
    puts "тыры-пыры"
  elsif (num % 3).zero?
    puts "тыры"
  elsif (num %5 ).zero?
    puts "пыры"
  else
    puts num
  end
end
