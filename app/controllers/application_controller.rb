class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_404
    render json: '', status: :not_found
  end
end
