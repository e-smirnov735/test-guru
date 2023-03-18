class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order(title: :asc) }
  scope :by_name, ->(name) { where(title: name) }

  validates :title, presence: true
end
