class MessageMailer < ApplicationMailer
	default from: "2morrow2late10@gmail.com"

	def message(client)
    	@client = client
    	mail(to: @clients.email, subject: 'Welcome to My Awesome Site')
  	end
end
