class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true, allow_nil: false
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    return true if question.answers_count < 4
    errors.add(:base, :answers_count, message: 'Too mutch answers for question.')
  end
end
