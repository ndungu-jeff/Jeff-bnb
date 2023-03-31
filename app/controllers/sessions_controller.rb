class SessionsController < ApplicationController
    skip_before_action :authorize

    def create
      user = Owner.find_by(username: params[:username]) || Client.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :created
      else
        render json: { error: "Invalid username or password" }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete :user_id
      head :no_content
    end
  
end