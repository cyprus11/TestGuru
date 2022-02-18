class TestPassage < ApplicationRecord
  SUCCESSFUL_EVAULATION = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :calculate_result, on: :update
  before_update :before_update_set_next_question

  scope :user_passages_tests, -> (user) { joins(:test).where(user: user) }
  scope :successfull, -> { where('result >= ?', SUCCESSFUL_EVAULATION) }

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def test_questions
    self.test.questions
  end

  # def result
  #   self.correct_questions / test.questions.count * 100
  # end

  def success?
    self.result >= SUCCESSFUL_EVAULATION
  end

  def current_question_position
    test_questions.index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return unless answer_ids.present?

    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    (correct_answers_count == answer_ids.count)
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def calculate_result
    self.result = self.correct_questions / test.questions.count * 100
  end
end
