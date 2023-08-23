module RuleList
  def self.attempt(result, count)
    result.user.tests.where(id: result.test.id).count == count.to_i
  end

  def self.by_category(result, param)
    category_id = Category.find_by(title: param).id
    ids_by_tests = Test.where(category_id:).ids.to_set
    ids_by_user = passed_tests_ids_by_category(result.user, category_id).to_set

    ids_by_tests.subset?(ids_by_user) &&
      result.user.badges.joins(:badge_rule)
            .where(rule_params: param,
                   badge_rule: { title: "by_category" }).empty?
  end

  def self.by_level(result, level)
    ids_all_tests = Test.by_level(level).ids.to_set
    ids_user_passed_tests = passed_tests_ids_by_level(result.user, level).to_set

    ids_all_tests.subset?(ids_user_passed_tests) &&
      result.user.badges.joins(:badge_rule)
            .where(rule_params: level,
                   badge_rule: { title: "by_level" }).empty?
  end

  # find list of all passed test's ids by category

  def self.passed_tests_ids_by_category(user, category_id)
    user.results.joins(:test)
        .merge(Test.where(category_id:))
        .where(is_passed: true)
        .pluck("test_id")
  end

  # find list of all passed test's ids by level

  def self.passed_tests_ids_by_level(user, level)
    user.results.joins(:test)
        .merge(Test.by_level(level))
        .where(is_passed: true)
        .pluck("test_id")
  end
end
