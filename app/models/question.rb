class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true, length: { minimum: 20 }
  validate :validate_answers_count

  def answers_count
    answers.count
  end
end
