class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer_in_sec, numericality: { only_integer: true, greater_than: 0 }

  scope :by_level, ->(test_level) { where(level: test_level) }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, lambda { |category_title|
    joins(:category).where(categories: { title: category_title })
  }

  def self.category_list_by_title(category_title)
    by_category(category_title).order(title: :desc).pluck(:title)
  end
end
