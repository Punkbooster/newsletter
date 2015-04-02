class MessageMailer < ApplicationMailer
	default from: "2morrow2late10@gmail.com"

	def send_message(client, letter)
		@letter = letter
    	@client = client
    	mail(to: @client.email, subject: 'Welcome to My Awesome Site')
  	end
end
