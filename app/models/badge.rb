class Badge < ApplicationRecord
  DEFAULT_IMAGE = "default_badge.png"
  ROLES = %i[from_the_first_time all_category all_levels]

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  validates :title, presence: true
  validates_with BadgeValidator

  def image
    read_attribute(:image) || DEFAULT_IMAGE
  end

  def roles
    active_roles = []

    ROLES.each do |role|
      active_roles << role if read_attribute(role)
    end

    active_roles
  end

  def self.find_badge(test_passage)
    return badge_from_the_first_time(test_passage) | badge_all_category(test_passage) | badge_all_level(test_passage)
  end

  private

  def self.badge_from_the_first_time(test_passage)
    test = test_passage.test
    user = test_passage.user

    if test_passage.success? && user.tests.where(id: test).size == 1
      return Badge.where(from_the_first_time: true)
    end
    []
  end

  def self.badge_all_category(test_passage)
    test = test_passage.test
    user = test_passage.user
    category_tests = test.category.tests
    user_tests = user.test_passages.select(&:success?).map(&:test)

    if category_tests.size == user_tests.size
      return Badge.where(all_category: true)
    end
    []
  end

  def self.badge_all_level(test_passage)
    test = test_passage.test
    user = test_passage.user
    level = test.level
    tests = Test.where(level: level)

    unless (tests - user.tests).any?
      return Badge.where(all_levels: true)
    end
    []
  end
end
