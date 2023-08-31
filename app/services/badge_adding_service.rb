class BadgeAddingService
  RULES = {
    all_category: BadgeRule::AllCategoryRuleSpecification,
    all_level: BadgeRule::AllLevelRuleSpecification,
    attempt_count: BadgeRule::AttemptCountRuleSpecification
  }.freeze

  def initialize(result)
    @result = result
  end

  def call
    return unless @result.is_passed

    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(@result, badge.rule_value)

      add_badge(badge) if rule.satisfied?
    end
  end

  def self.call(...)
    new(...).call
  end

  private

  def add_badge(badge)
    @result.user.badges << badge
  end
end
