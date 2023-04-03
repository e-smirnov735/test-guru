class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :email, presence: true

  def find_tests_by_level(test_level)
    tests.by_level(test_level)
  end

  def test_passage(test)
    test.results.order(id: :desc).find_by(test_id: test.id)
  end
end
