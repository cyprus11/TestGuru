class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test

  validates :body, presence: true, length: { minimum: 20 }

  def answers_count
    answers.count
  end
end
