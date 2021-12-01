class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :created_tests, foreign_key: :user_id, class_name: 'Test'

  scope :user_tests, -> (level) { tests.where(level: level) }

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
