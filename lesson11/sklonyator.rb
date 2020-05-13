def inclination(num, singular, singular_rod, plural_rod)
  modul = num % 10
  modul_2 = num % 100

  if (11..14).cover?(modul_2)
    return plural_rod
  elsif modul == 1
    return singular
  elsif (2..4).cover?(modul)
    return singular_rod
  else
    return plural_rod
  end
end

puts 'Сколько вам оленей?'

num = STDIN.gets.to_i
puts

puts "Вот вам #{num} #{inclination(num, 'олень', 'оленя', 'оленей')}."
