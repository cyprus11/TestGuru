class Category < ApplicationRecord
  has_many :tests

  default_scope { order(:title) }

  validates :title, presence: true, length: { minimum: 10, maximum: 100}
end
