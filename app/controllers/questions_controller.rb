class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :current_test, only: %i[index create new]
  before_action :current_question, only: %i[show destroy]

  def index; end

  def new; end

  def show; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to question_path(@question)
    else
      render :show
    end
  end

  def destroy
    @question.destroy!

    render plain: "вопрос: '#{@question.body}' из теста #{@question.test_id} успешно удален!"
  end

  private

  def record_not_found
    render plain: "Запрашиваемый ресурс не найден", status: :not_found
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def current_test
    @test = Test.find(params[:test_id])
  end

  def current_question
    @question = Question.find(params[:id])
  end
end
