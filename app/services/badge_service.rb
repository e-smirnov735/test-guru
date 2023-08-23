class BadgeService
  def initialize(result)
    @result = result
  end

  def call
    return unless @result.is_passed

    check
  end

  private

  def check
    Badge.all.each do |badge|
      rule_title = badge.badge_rule.title
      param = badge.rule_params

      add_badge(badge) if RuleList.send(rule_title, @result, param)
    end
  end

  def add_badge(badge)
    @result.user.badges.push(badge)
  end
end
