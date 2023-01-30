class Question

  attr_reader :correct_answer

  def initialize()
    @first_number = rand(1...20)
    @second_number = rand(1...20)
    @correct_answer = @first_number + @second_number
  end

  def display_question
    "what is #{@first_number} + #{@second_number}?"
  end

  def correct?(answer)
    answer == @correct_answer
  end

end