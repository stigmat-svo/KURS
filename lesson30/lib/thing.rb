class Thing
  attr_reader :name, :type, :temp_down, :temp_up

  def initialize(name, type, temp = {})
    @name = name
    @type = type
    @temp_down = temp[:min]
    @temp_up = temp[:max]
  end

  def weather_compatible?(temp)
    temp.between?(@temp_down, @temp_up)
  end

  def to_s
    "#{name} (#{type}) #{temp_down}..#{temp_up}"
  end
end
