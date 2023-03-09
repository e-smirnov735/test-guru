class User < ApplicationRecord
  def find_tests_by_level(level)
    Test.joins("JOIN users_tests ON tests.id = users_tests.test_id")
        .where("user_id = ? AND level = ?", id, level)
  end
end
