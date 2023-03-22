class QuestionsController < ApplicationController
  before_action :current_question, only: %i[show destroy delete]

  def index
    @questions = Question.all
  end

  def new; end

  def show; end

  def delete; end

  def create
    Question.create!(question_params)
    render plain: "вопрос успешно создан!"
  end

  def destroy
    @question.destroy!
    render plain: "вопрос: '#{@question.body}' из теста #{@question.test_id} успешно удален!"
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def current_question
    @question = Question.find(params[:id])
  rescue => e
    head :not_found
  end
end
