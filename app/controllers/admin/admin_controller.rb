class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'admin'

  before_filter :save_return_path
  before_filter :authenticate!
  helper_method :current_user, :user_signed_in?

  private
    def save_return_path
      session[:return_path] = request.path
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:user_id)
      nil
    end

    def user_signed_in?
      current_user.present?
    end

    def authenticate!
      return if user_signed_in?

      origin = request.post? ? root_url : request.fullpath

      redirect_to(login_url(provider: 'facebook', origin: origin))
    end
end
