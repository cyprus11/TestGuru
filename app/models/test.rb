class Test < ApplicationRecord
  has_many :users_tests
  has_many :users, through: :users_tests
  has_many :questions
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..)) }
  scope :sorted_tests, -> (category_name) { joins(:category).where(category: {title: category_name}).order(title: :desc) }

  validates :title, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :validate_title_and_level

  private

  def validate_title_and_level
    message = "Title and level are not unique."
    (errors.add(:title, message: message) && errors.add(:level, message: message)) if Test.find_by(title: title, level: level)
  end
end
