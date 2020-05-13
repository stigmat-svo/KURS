require 'pony'
require 'io/console' # гем для шифровки пароля

puts '*** ПОЧТОВЫЙ КЛИЕНТ ***'

my_mail = 'sheludko.vo@gmail.com'

#puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
#password = STDIN.noecho(&:gets).chomp # шифруем пароль
password = 'a1915292'

#puts 'Кому отправить письмо?'
send_to = 'stigmat.svo@gmail.com'

puts "\nТема письма:"
subject = STDIN.gets.strip

puts "\nТекст письма:"
body = STDIN.gets.strip

Pony.mail(
  subject: subject,
  body: body,
  to: send_to,
  from: my_mail,
  charset: 'UTF-8',
  via: :smtp,
  via_options: {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: my_mail,
    password: password,
    authentication: :plain,
  }
)

puts 'Письмо успешно отправлено!'

# Настройки Pony для ящика на gmail.com
#
# via: :smtp,
# via_options: {
#   address: 'smtp.gmail.com',
#   port: '587',
#   enable_starttls_auto: true,
#   user_name: my_mail,
#   password: password,
#   authentication: :plain,
# }
#
# Настройки Pony для почтового ящика на yandex.ru
#
# via: :smtp,
# via_options: {
#   address: 'smtp.yandex.ru',
#   port: '465',
#   enable_starttls_auto: true,
#   tls: true,
#   user_name: my_mail,
#   password: password,
#   authentication: :plain,
# }
#