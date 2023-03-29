class TestsController < ApplicationController

  before_action :current_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions

  end

  private

  def current_test
    @test = Test.find(params[:id])
  end
end
