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

adress1 = Adress.new('Украина', 'Новоазовский', 'Мариуполь', 'Азовстальская', 160, 118)
adress2 = Adress.new('ДНР', 'Старобешевский', 'Докучаевск', 'Ленина', 23, 5)
adress3 = Adress.new('Украина', 'Волновахский', 'Волноваха', 'Тараса Пупки', 54, 2)

[adress1, adress2, adress3].each do |adress|
  puts "Адрес: #{adress.full_adress}"
end
