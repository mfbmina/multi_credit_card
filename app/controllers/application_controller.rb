class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::ParameterMissing, with: :render_400

  private

  def authenticate_user_from_token!
    token = request.headers['Authorization']
    user = User.find_by_authentication_token(token)
    user ? sign_in(user, store: false) : render(json: '', status: :forbidden)
  end

  def render_400(exception)
    render json: { errors: [exception.message] }, status: :bad_request
  end

  def render_404(exception)
    error = "Couldn't find #{exception.model} with ID #{exception.id}"
    render json: { errors: [error] }, status: :not_found
  end
end
