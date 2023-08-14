class Badge < ApplicationRecord
  belongs_to :badge_rule

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
  validates :rule_params, presence: true
end
