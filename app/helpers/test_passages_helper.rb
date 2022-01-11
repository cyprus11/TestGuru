module TestPassagesHelper
  def text_color(correct_questions_count)
    return 'green' if correct_questions_count >= 85
    'red'
  end

  def question_position(current_question, all_questions)
    all_questions.index(current_question) + 1
  end
end