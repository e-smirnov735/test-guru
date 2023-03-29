class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :current_test, only: %i[index create new]
  before_action :current_question, only: %i[show destroy edit update]

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def show
    @test = Test.find(@question.test_id)
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @test = Test.find(@question.test_id)
  end

  def update
    @test = Test.find(@question.test_id)

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!

    redirect_to test_questions_url(@question.test_id)
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
