class FeedbacksMailer < ApplicationMailer

  def send_feedback(feedback)
    @user = feedback.user
    @title = feedback.title
    @text = feedback.text

    mail to: User.admins_email
  end
end