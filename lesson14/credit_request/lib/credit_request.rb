class CreditRequest
  attr_reader :age, :salary, :gender,
              :credit_history,
              :request_ammount

  def initialize(age, salary, gender,
                 credit_history,
                 request_ammount)
    @age = age
    @salary = salary
    @gender = gender
    @credit_history = credit_history
    @request_ammount = request_ammount
    @scoring = calculate_scoring
  end

  def calculate_scoring
    result = 0
    if @age >= 21 && @age <= 40
      result += 10
    elsif @age > 40
      result += 20
    end
    result += 10 if @gender == 'w'
    if @salary >= 20_000 && @salary <= 40_000
      result += 10
    elsif @salary > 40_000
      result += 20
    end
    result += 20 if @credit_history == 'y'
    if @request_ammount >= 20_000 && @request_ammount <= 40_000
      result += 10
    elsif @request_ammount < 20_000
      result += 20
    end
  end

  def approve?
    @scoring >= 50
  end
end
