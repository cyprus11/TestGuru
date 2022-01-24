class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :destroy, foreign_key: :current_question_id
  belongs_to :test

  validates :body, presence: true, length: { minimum: 20 }

  def answers_count
    answers.count
  end
end
