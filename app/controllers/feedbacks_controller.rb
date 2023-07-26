class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      FeedbackMailer.feedback_email(@feedback).deliver_now

      flash[:success] = 'Сообщение успешно отправлено'
      redirect_to root_path
    else
      flash[:alert] = 'Произошла ошибка'
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
