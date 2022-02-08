class Test < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..)) }
  scope :categories, -> (category_name) { joins(:category).where(category: {title: category_name}) }
  scope :with_questions, -> () { where(id: Question.with_answers.pluck(:test_id).uniq)}

  validates :title, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.sorted_tests(category_name)
    categories(category_name).order(title: :desc).pluck(:title)
  end
end
