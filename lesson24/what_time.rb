puts "Сколько раз вывести время?"

user_input = STDIN.gets.to_i

user_input = 10 if user_input.zero?

user_input.times do
  puts Time.now
  sleep 1
end
