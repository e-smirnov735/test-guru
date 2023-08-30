class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_result, only: %i[show result update final]
  before_action :time_left, only: %i[show update]

  def index
    @results = current_user.results
  end

  def show; end

  def result; end

  def update
    @result.accept!(params[:answers_ids])

    if @result.completed?
      final
    else
      render :show
    end
  end

  def final
    BadgeAddingService.call(@result)
    TestTimerService.call(@result)
    TestsMailer.completed_test(@result).deliver_now

    redirect_to result_result_path(@result)
  end

  private

  def time_left
    return unless @result.test.timer_in_sec

    @time_left = @result.test.timer_in_sec - (Time.now - @result.created_at).to_i
  end

  def find_result
    @result = Result.find(params[:id])
  end
end
