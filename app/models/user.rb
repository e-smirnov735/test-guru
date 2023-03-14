class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
  has_many :results, dependent: :destroy

  def find_tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
