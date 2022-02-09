class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :destroy, foreign_key: :current_question_id
  has_many :gists, dependent: :destroy
  belongs_to :test

  validates :body, presence: true, length: { minimum: 10 }

  def answers_count
    answers.count
  end
end
