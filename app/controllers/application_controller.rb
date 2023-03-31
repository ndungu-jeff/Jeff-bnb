class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authorize
    # show error message when trying to use invalid parameters to create entity
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_params
    # show error message when requested resouce is not found
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private

    def invalid_params(invalid)
        render json: { errors: [invalid.record.errors] }, status: :unprocessable_entity
    end

    def render_not_found(invalid)
        render json: { errors: [invalid.exception] }, status: :not_found
    end

    def authorize
        return render json: { errors: "You are Unauthorized to access, please log in or contact support for access" }, status: :unauthorized unless session.include? :user_id
    end
end
