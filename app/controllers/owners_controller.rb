class OwnersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # "/post" Creates a new instance of an Owner (Create)
    def create
        owner = Owner.create!(owner_params)
        render json: owner, status: :created
    end

    # '/owner/:id' displays an owner of id in params(Read by show in rails)
    def show
        owner = find_owner
        render json: owner
    end

    def show_me
        user = Owner.find_by(id: session[:user_id])
        render json: user
    end

    # '/owner/:id' edits an owner of id in params(Update)
    def update
        owner = find_owner
        owner.update!(owner_params)
        render json: owner
    end

    # '/owner/:id' deletes an owner of id in params(Delete by destroy)
    def destroy
        owner = find_owner
        owner.destroy
        head :no_content
    end

    private
    
    def find_owner
        Owner.find(params[:id])
    end

    def owner_params
        params.permit(:full_name, :username, :password, :phone_number)
    end
end
