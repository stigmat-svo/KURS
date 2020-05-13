# Подключаем библиотеку для работы с датами
require 'date'

# Класс Прогноз Метеосервиса — соответствует одному тегу <FORECAST>
class Forecast

  # Массивы строк для времени суток и степени облачности
  TIME_OF_DAY = %w(ночь утро день вечер).freeze
  CLOUDINESS = %w(Ясно Малооблачно Облачно Пасмурно).freeze

  # Конструктор класса записывает переданные параметры в соответствующие
  # переменные экземпляра класса
  def initialize(params)
    @date = params[:date]
    @time_of_day = params[:time_of_day]
    @temp_min = params[:temp_min]
    @temp_max = params[:temp_max]
    @cloudiness = params[:cloudiness]
    @max_wind = params[:max_wind]
  end

  # Метод класса from_xml_node возвращает экземпляр класса, прочитанные из
  # элемента XML-структуры с прогнозом
  def self.from_xml(node)
    day = node.attributes['day']
    month = node.attributes['month']
    year = node.attributes['year']

    new(
      date: Date.parse("#{day}.#{month}.#{year}"),
      time_of_day: TIME_OF_DAY[node.attributes['tod'].to_i],
      temp_min: node.elements['TEMPERATURE'].attributes['min'].to_i,
      temp_max: node.elements['TEMPERATURE'].attributes['max'].to_i,
      cloudiness: node.elements['PHENOMENA'].attributes['cloudiness'].to_i,
      max_wind: node.elements['WIND'].attributes['max'].to_i
    )
  end


  def to_s
    puts "--------------------------------------"
    result = today? ? 'Сегодня' : @date.strftime('%d.%m.%Y')

    result << ", #{@time_of_day}\n \n#{temp_range_string}, ветер #{@max_wind} м/с, #{CLOUDINESS[@cloudiness]}."

    result
  end

  def temp_range_string
    result = ''
    result << '+' if @temp_min > 0
    result << "#{@temp_min}.."
    result << '+' if @temp_max > 0
    result << @temp_max.to_s
    result
  end

  def today?
    @date == Date.today
  end
end
