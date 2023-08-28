class BadgeRule::AllLevelRuleSpecification < AbstractBadgeRuleSpecification
  def satisfied?
    ids_all_tests = Test.by_level(@value).ids.to_set
    ids_user_passed_tests = passed_tests_ids_by_level.to_set

    ids_all_tests.subset?(ids_user_passed_tests) &&
      @result.user.badges.where(
        rule_type: "all_level", rule_value: @value
      ).empty?
  end

  private

  def passed_tests_ids_by_level
    @result.user.results.joins(:test)
           .merge(Test.by_level(@value))
           .where(is_passed: true)
           .pluck("test_id")
  end
end
