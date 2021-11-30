class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests
  has_many :tests_author, as: :author, class_name: 'Test'

  def user_tests(level)
    tests.where(level: level)
  end
end
