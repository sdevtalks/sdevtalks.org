class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def render_404(err = nil)
    render 'errors/404', status: 404
  end
end
