class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_result, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @result.accept!(params[:answers_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question).call
    flash_options = ''

    if result
      gist = Gist.new(url: result.html_url, user: current_user, question: @result.current_question)
      gist.save!

      flash_options = { notice: t('.success',
                                  href: view_context.link_to(t('.here'), result.html_url)) }
    else
      { alert: t('.failure') }
    end

    redirect_to @result, flash_options
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
