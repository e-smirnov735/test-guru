class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :current_test, only: %i[create new]
  before_action :current_question, only: %i[show destroy edit update]

  def new
    @question = @test.questions.new
  end

  def show
    @test = @question.test
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
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!

    redirect_to test_path(@question.test_id)
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
