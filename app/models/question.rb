class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :destroy, foreign_key: :current_question_id
  has_many :gists, dependent: :destroy
  belongs_to :test

  scope :with_answers, -> () { joins(:answers).where(answers: {question_id: Question.pluck(:id)}).uniq }

  validates :body, presence: true, length: { minimum: 10 }

  def answers_count
    answers.count
  end
end
