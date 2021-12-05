class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true, allow_nil: false
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:base, :answers_count, message: 'Too mutch answers for question.') unless (question.answers_count + 1).in?(1..4)
  end
end
