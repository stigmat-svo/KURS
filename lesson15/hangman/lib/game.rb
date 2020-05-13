class Game
  TOTAL_ERRORS_ALLOWED = 7

  def initialize(word)
    @letters = word.chars
    @user_guess = []
  end

  def errors
    @user_guess - @letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    result =
      @letters.map do |letter|
        letter if @user_guess.include?(letter)
      end

    result
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    @user_guess << letter if !over? && !@user_guess.include?(letter)
  end

  def word
    @letters.join
  end

  def won?
    (@letters - @user_guess).empty?
  end
end
