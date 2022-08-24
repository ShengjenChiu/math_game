class Question
  attr_accessor :operand1, :operand2

  def initialize
    @operand1 = rand(1..20)
    @operand2 = rand(1..20)
  end

  # getter that do the math operation
  def math_answer
    @operand1 + @operand2
  end
  
  def ques_user
    puts "What does #{@operand1} plus #{@operand2} equal?"
  end

end

# g = Question.new
# puts g.operand1
# puts g.operand2
# p g.math_answer