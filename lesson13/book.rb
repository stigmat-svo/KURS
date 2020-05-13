class Book
  def initialize(author, title, year)
    @author = author
    @title = title
    @genre = year.to_i
  end

  attr_reader :author

  attr_reader :title

  attr_reader :genre
end

book1 = Book.new('Пол Гэллико', 'Томасина', 1957)
book2 = Book.new('Томас Майн Рид', 'Оцеола - вождь сименолов', 1858)
book3 = Book.new('Вальтер Скотт', 'Айвенго', 1819)

[book1, book2, book3].each do |book|
  puts "Автор: #{book.author}"
  puts "Название: #{book.title}"
  puts "Год издания: #{book.genre}"
  puts
end
