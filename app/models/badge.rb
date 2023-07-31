class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :rule, presence: true, uniqueness: true
end
