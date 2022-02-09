class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <deploy@tav-dev.tk>}
  layout 'mailer'
end
