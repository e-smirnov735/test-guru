class FeedbackMailer < ApplicationMailer
  layout 'mailer'
  def feedback_email(feedback)
    @name = feedback.name
    @message = feedback.message
    @email = feedback.email

    mail(from: @email, to: ENV.fetch('ADMIN_EMAIL', nil), subject: 'Feedback from TestGuru')
  end
end
