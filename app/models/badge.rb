class Badge < ApplicationRecord
  DEFAULT_IMAGE = "default_badge.png"
  AVAILABLE_ROLE_LIST = {
    "first_time": "Тест пройденный с первого раза",
    "category_tests": "Пройденные тесты из одной категории",
    "level_tests": "Пройденные тесты одного уровня"
  }

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  validates :title, presence: true
  validates :role_name, inclusion: { in: AVAILABLE_ROLE_LIST.keys }
  validates_with BadgeValidator

  def image
    read_attribute(:image) || DEFAULT_IMAGE
  end

end
