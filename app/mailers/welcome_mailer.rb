class WelcomeMailer < ApplicationMailer
  default from: 'geoffhull03@gmail.com'

  def new_email(user)
    mail(to: user.email, subject: "Welcome to Blocmarks!")
  end
end
