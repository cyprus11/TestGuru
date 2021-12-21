class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :user_id, class_name: 'Test'

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def user_tests(level)
    tests.where(level: level)
  end
end
