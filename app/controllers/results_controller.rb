class ResultsController < ApplicationController
  before_action :find_result, only: %i[show result update]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answers_ids])

    if @result.completed?
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
