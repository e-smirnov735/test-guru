class TestTimerService < ApplicationService
  attr_reader :time

  def initialize(result)
    @result = result
  end

  def call
    return unless @result.test.timer_in_sec

    @result.is_passed = false unless passed?
  end

  def passed?
    @result.created_at + @result.test.timer_in_sec <= Time.now
  end
end
