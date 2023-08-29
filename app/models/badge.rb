class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
  validates :rule_type, uniqueness: { scope: :rule_value }
  validates :rule_value, presence: true
end
