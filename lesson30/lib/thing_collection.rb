class ThingCollection
  def initialize(clothes = [])
    @clothes = clothes
  end

  def self.from_dir(path)
    things =
      Dir["#{path}/data/*.txt"].
        map do |path|
        item = File.readlines(path, chomp: true)
        temp_range = item[2].gsub(/[^+\-\d ]/, '')
        Thing.new(
          item[0],
          item[1],
          min: temp_range.split.first.to_i,
          max: temp_range.split.last.to_i
        )
      end
    self.new(things)
  end

  def suitable_for_weather(temp)
    @clothes.select! do |item|
      item.weather_compatible?(temp)
    end
  end

  def type_for_temp(temp)
    suitable_for_weather(temp)
    thing_types.map do |item|
      same_type_things(item).sample
    end
  end

  def thing_types
    @clothes.map do |item|
      item.type
    end.uniq
  end

  def same_type_things(type)
    @clothes.select do |item|
      item.type == type
    end
  end
end
