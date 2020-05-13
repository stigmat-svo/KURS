require 'date'

class Adress
  def initialize(country, area, locality, street, building, apartments)
    @country = country
    @area = area
    @locality = locality
    @street = street
    @building = building.to_i
    @apartments = apartments.to_i
  end

  def full_adress
    "ул. #{@street}, д. #{@building}, кв. #{@apartments}, г. #{@locality}, #{@area} район, #{@country}"
  end
end

class Patient
  def initialize(name, father_name, surname, date_of_birth)
    @name = name
    @father_name = father_name
    @surname = surname
    @date_of_birth = Date.parse(date_of_birth)
  end

  def full_name
    "#{@surname} #{@name[0]}.#{@father_name[0]}."
  end

  def age
    today = Date.today
    result = today.genre - @date_of_birth.genre - 1

    if today.month > @date_of_birth.month ||
       today.month == @date_of_birth.month &&
       today.day >= @date_of_birth.day
      result += 1
    end
    result
  end
end

vitalik = Patient.new('Виталий', 'Олегович', 'Шелудько', '19.05.1982')
elena = Patient.new('Елена', 'Олеговна', 'Шинкарева', '07.09.1986')

adress1 = Adress.new('Украина', 'Новоазовский', 'Мариуполь', 'Азовстальская', 160, 118)
adress2 = Adress.new('ДНР', 'Старобешевский', 'Докучаевск', 'Ленина', 23, 5)

puts 'Пациент 1:'
puts vitalik.full_name
puts "Возраст: #{vitalik.age}"
puts "Адрес: #{adress1.full_adress}"
puts
puts 'Пациент 2:'
puts elena.full_name
puts "Возраст: #{elena.age}"
puts "Адрес: #{adress2.full_adress}"
puts
