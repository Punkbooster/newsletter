class LettersController < ApplicationController
	
	def index
		@letters  = Letter.all
	end

	def show
		@letter = Letter.find params[:id]
	end

	def new
    	@letter = Letter.new
  	end

  	def create
  		@letter = Letter.new letter_params

  		if @letter.save
  			 # Tell the MessageMailerr to send a Message email after save
        	@clients = Client.all

        	@clients.each do |client|
        		MessageMailer.send_message(client, @letter).deliver
        	end

  			redirect_to letters_path
  		else
  			render :action => :new
  		end

  	end

	def edit
		@letter = Letter.find params[:id]
	end

	def update
		@letter = Letter.find params[:id]
		if @letter.update_attributes letter_params
			redirect_to letter_path
		else
			render :action => :edit
		end
	end

	def destroy
    	@letter = Letter.find params[:id]
    	@letter.destroy
    	redirect_to letters_path
  	end

	private

	def letter_params
		params.require(:letter).permit(:title, :topic, :content)
	end 

end
