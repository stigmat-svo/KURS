class Movie
  attr_reader :title, :director, :year

  def initialize(title, director, year)
    @title = title
    @director = director
    @year = year
  end
end
