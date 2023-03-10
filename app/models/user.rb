class User < ApplicationRecord
  def find_tests_by_level(test_level)
    Test.joins("JOIN users_tests ON tests.id = users_tests.test_id")
        .where(users_tests: { user_id: id }, tests: { level: test_level })
  end
end
