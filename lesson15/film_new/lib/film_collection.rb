class FilmCollection

  def initialize(movies)
    @movies = movies
    @directors = @movies.map(&:director).uniq
  end

  def dir_list
    @directors
  end

  def mov_list(choice)
    selected =
      (@movies.select do |movie|
        movie.director == @directors[choice - 1]
      end).sample
  end
end
