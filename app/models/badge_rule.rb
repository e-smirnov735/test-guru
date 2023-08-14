class BadgeRule < ApplicationRecord
  has_one :badge
  validates :title, presence: true, uniqueness: true
end
