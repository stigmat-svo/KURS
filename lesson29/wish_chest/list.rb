require 'rexml/document'
require 'date'
require_relative 'lib/wish'

path = File.dirname(__FILE__ ) + "/wish.xml"

abort "Файл #{path} не найден!" unless File.exist?(path)

doc = File.open(path, "r:UTF-8") do |file|
  REXML::Document.new(file)
end

wishes = []

doc.elements.each("wishes/wish") do |node|
  wishes << Wish.new(node)
end

puts "Эти желания должны уже были сбыться к сегодняшнему дню:"

wishes.each do |wish|
  if wish.overdue?
    puts wish
  end
end

puts "А этим желаниям ещё предстоит сбыться:"

wishes.each do |wish|
  unless wish.overdue?
    puts wish
  end
end
