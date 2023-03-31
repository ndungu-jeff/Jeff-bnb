class ClientsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # "/post" Creates a new instance of an Owner (Create)
    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    # '/client/:id' displays a client of id in params(Read by show in rails)
    def show
        client = find_client
        render json: client
    end

    def show_me
        user = Owner.find_by(id: session[:user_id])
        render json: user
    end

    # '/client/:id' edits an client of id in params(Update)
    def update
        client = find_client
        client.update!(client_params)
        render json: client
    end

    # '/client/:id' deletes an client of id in params(Delete by destroy)
    def destroy
        client = find_client
        client.destroy
        head :no_content
    end

    private
    
    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:full_name, :username, :password, :phone_number, :email)
    end
end
