class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_result

  def create
    result = GistQuestionService.new(@result.current_question).call

    if result.success?
      Gist.create!(url: result.gist_url, user: current_user,
                   question: @result.current_question)
    end

    redirect_to @result, flash_msg(result.success?, result.gist_url)
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end

  def flash_msg(is_success, url)
    if is_success
      { notice: t('.success',
                  href: view_context.link_to(t('.here'), url,
                                             target: "_blank",
                                             rel: "nofollow noopener")) }
    else
      { alert: t('.failure') }
    end
  end
end
