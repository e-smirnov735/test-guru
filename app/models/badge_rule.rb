class BadgeRule < ApplicationRecord
  has_many :badge, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
