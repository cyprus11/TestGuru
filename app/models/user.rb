class User < ApplicationRecord
  devise :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :user_id, class_name: 'Test'
  has_many :gists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def user_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def is_admin?
    self.type == 'Admin'
  end

  def add_badges(badges)
    self.badges << badges
  end

end
