class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_result, only: %i[show result update]

  def index
    @results = current_user.results
  end

  def show; end

  def result; end

  def update
    @result.accept!(params[:answers_ids])

    if @result.completed?
      add_badges
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def add_badges
    @result.add_first_attempt_badge if @result.add_first_attempt_badge?
    @result.add_all_ruby_badge if @result.add_all_ruby_badge?
  end

  def find_result
    @result = Result.find(params[:id])
  end
end
