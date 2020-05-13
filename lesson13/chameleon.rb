class Chameleon
  def initialize(color)
    @color = color
  end

  attr_reader :color

  attr_writer :color
end

billy = Chameleon.new('красный')
puts "Сейчас я #{billy.color}!"
billy.color = 'синий'
puts "Теперь я #{billy.color}!"
billy.color = 'фиолетовый'
puts "Теперь я #{billy.color}!"
