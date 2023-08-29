class BadgeRule::AllCategoryRuleSpecification < AbstractBadgeRuleSpecification
  def satisfied?
    category_id = Category.find_by(title: @value).id
    ids_by_tests = Test.where(category_id:).ids.to_set
    ids_by_user = passed_tests_ids_by_category(category_id).to_set

    ids_by_tests.subset?(ids_by_user) &&
      @result.user.badges.where(
        rule_type: "all_category", rule_value: @value
      ).empty?
  end

  private

  def passed_tests_ids_by_category(category_id)
    @result.user.results.joins(:test)
           .merge(Test.where(category_id:))
           .where(is_passed: true)
           .pluck("test_id")
  end
end
