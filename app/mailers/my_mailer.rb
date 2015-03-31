class MyMailer < ApplicationMailer
	default from: "2morrow2late10@gmail.com"

	def welcome_email(client)
    @client = client
    mail(to: @client.email, subject: 'Welcome to My Awesome Site')
  end
end
