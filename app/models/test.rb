class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests
  has_many :questions
  belongs_to :category

  def self.sorted_tests(category_name)
    joins(:category).where(category: {title: category_name}).order(title: :desc)
  end
end
