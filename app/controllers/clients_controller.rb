class ClientsController < ApplicationController
	
	def index
		if params[:search]
    		@clients = Client.search(params[:search]).order("created_at DESC")
  		else
    		@clients = Client.all.order('created_at DESC')
  		end
	end

	def show
		@client = Client.find params[:id]
	end

	def new
    	@client = Client.new
  	end

  	def create
  		@client = Client.new client_params
  		if @client.save

  			 # Tell the UserMailer to send a welcome email after save
        	MyMailer.welcome_email(@client).deliver
  			
  			redirect_to clients_path
  		else
  			render :action => :new
  		end

  	end

	def edit
		@client = Client.find params[:id]
	end

	def update
		@client = Client.find params[:id]
		if @client.update_attributes client_params
			redirect_to client_path
		else
			render :action => :edit
		end
	end

	def destroy
    	@client = Client.find params[:id]
    	@client.destroy
    	redirect_to clients_path
  	end

	private

	def client_params
		params.require(:client).permit(:imie, :nazwisko, :email)
	end 

end
