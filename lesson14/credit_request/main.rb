require_relative 'lib/credit_request'

puts 'Добро пожаловать! Возьмите у нас кредит!'
puts

puts 'Сколько вам полных лет?'
age = gets.to_i

puts 'Какая у вас месячная зарплата (в рублях)?'
salary = gets.to_i

puts 'Ваш пол (m/w):'
gender = gets[0]

puts 'Есть ли у вас кредитная история (y/n)?'
credit_history = gets[0]

puts 'Сколько денег вы хотите взять?'
request_ammount = gets.to_i

credit_request =
  CreditRequest.new(age, salary, gender, credit_history, request_ammount)

if credit_request.approve?
  puts 'Одобрено'
else
  puts 'Не одобрено'
end
