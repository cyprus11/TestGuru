class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests
  has_many :questions
  belongs_to :category

  scope :sorted_tests, -> (category_name) { includes(:category).where(category: {title: category_name}).order(title: :desc)}
end
