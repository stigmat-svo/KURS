person = {
  name: "Виталий",
  age: "38"
}

def happy_birthday(person)
  congratulation = "Дорогой #{person[:name]}," \
  "\n" \
  "\nПоздравляем Вас с днём рождения!" \
  "\nВам сегодня исполняется аж #{person[:age]}!" \
  "\n" \
  "\nЖелаем успехов в изучении Ruby!"
end

puts happy_birthday(person)
