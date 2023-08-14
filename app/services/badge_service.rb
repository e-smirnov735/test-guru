class BadgeService
  def initialize(result)
    @user = result.user
    @test = result.test
    @result = result
    @category_id = @test.category_id
    @level = @test.level
  end

  def call
    return unless @result.is_passed

    add_first_attempt_badge if completed_on_first_attempt?
    add_by_category_badge if completed_by_category?
    add_by_level_badge if completed_by_level?
  end

  # RULE - add badge when test completed on the first attempt

  def completed_on_first_attempt?
    @user.tests.where(id: @test.id).count == 1
  end

  def add_first_attempt_badge
    badge = Badge.find_by(rule: "first_attempt")
    @user.badges.push(badge) if badge
  end

  # RULE = add badge when completed all tests by curent category

  def completed_by_category?
    ids_by_tests = Test.where(category_id: @category_id).ids.to_set
    ids_by_user = passed_tests_ids_by_category.to_set

    ids_by_tests.subset?(ids_by_user) &&
      @user.badges.find_by({ rule: "by_category", category_id: @category_id }).nil?
  end

  def add_by_category_badge
    badge = Badge.find_by({ rule: "by_category", category_id: @category_id })
    @user.badges.push(badge) if badge
  end

  # RULE = add badge when completed all tests by curent level

  def completed_by_level?
    ids_by_tests = Test.by_level(@level).ids.to_set
    ids_by_user = passed_tests_ids_by_level.to_set

    ids_by_tests.subset?(ids_by_user) &&
      @user.badges.find_by({ rule: "by_level", level: @level }).nil?
  end

  def add_by_level_badge
    badge = Badge.find_by({ rule: "by_level", level: @level })
    @user.badges.push(badge) if badge
  end

  private

  # find list of all passed test's ids by category

  def passed_tests_ids_by_category
    @user.results.joins(:test)
         .merge(Test.where(category_id: @category_id))
         .where(is_passed: true)
         .pluck("test_id")
  end

  # find list of all passed test's ids by level

  def passed_tests_ids_by_level
    @user.results.joins(:test)
         .merge(Test.by_level(@level))
         .where(is_passed: true)
         .pluck("test_id")
  end
end
