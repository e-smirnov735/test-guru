class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  scope :by_name, ->(name) { where(title: name) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true
end
