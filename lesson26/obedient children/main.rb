require_relative 'lib/parent'
require_relative 'lib/child'

father = Parent.new("Виталий Олегович")
vlad = Child.new("Владик")
eva = Child.new("Ева")

puts "#{father.name} послушный: #{father.obedient}"
puts "#{vlad.name} послушный: #{vlad.obedient}"
puts "#{eva.name} послушная: #{eva.obedient}"
