class User < ApplicationRecord
  has_many :users_tests
  has_many :tests, through: :users_tests

  def user_tests(level)
    tests.where(level: level)
  end
end
