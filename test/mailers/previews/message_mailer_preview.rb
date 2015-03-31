# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
	def message_preview
    MessageMailer.message(Client.first)
  end
end
