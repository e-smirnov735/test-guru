class AbstractBadgeRuleSpecification
  def initialize(result, value)
    @result = result
    @value = value
  end

  def satisfied?
    raise "#{__method__} undefined for #{self.class}"
  end
end
