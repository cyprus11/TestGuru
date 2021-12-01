class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true, length: { minimum: 20 }
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:answers_count) if answers.size > 4
  end
end
