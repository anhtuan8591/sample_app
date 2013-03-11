class Notifier < ActionMailer::Base
  default from: "anhtuan8591@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(email)
    @greeting = "Hi"

    mail to: email, subject: "the first email"
  end
end
