class Question
  attr_reader :question, :answer

  def initialize
    @question = ""
    @answer = 0
    self.generate
  end

  def generate
    num1 = rand(20)
    num2 = rand(20)
    math = rand(3)
    generate_addition(num1, num2) if math == 0
    generate_subtraction(num1, num2) if math == 1
    generate_multiplication(num1, num2) if math == 2
    generate_division(num1, num2) if math == 3
  end

  def validate(answer)
    @answer == answer
  end

  private

  def generate_addition(num1,num2)
    answer = num1 + num2
    @question = "What does #{num1} plus #{num2} equal?"
    @answer = answer
  end

  def generate_subtraction(num1,num2)
    answer = num1 - num2
    @answer = answer
    @question = "What does #{num1} minus #{num2} equal?"
  end

  def generate_multiplication(num1,num2)
    answer = num1 * num2
    @answer = answer
    @question = "What does #{num1} times #{num2} equal?"
  end

  def generate_division(num1,num2)
    while num2 == 0 do
      num2 = rand(20)
    end
    answer = num1 / num2
    @answer = answer
    @question = "What does #{num1} divided by #{num2} equal?"
  end

end