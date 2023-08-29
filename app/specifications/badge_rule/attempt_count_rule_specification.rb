class BadgeRule::AttemptCountRuleSpecification < AbstractBadgeRuleSpecification
  def satisfied?
    @result.user.tests.where(id: @result.test.id).count == @value.to_i
  end
end
