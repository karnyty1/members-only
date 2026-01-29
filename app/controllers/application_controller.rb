class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  helper_method :current_user , :logged_in?
  allow_browser versions: :modern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end


  def require_login
    redirect_to login_path unless logged_in?
  end
    

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
