class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  protected
  def not_authenticated
    redirect_to login_path, :alert => "Please login first."
  end

  private
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  helper_method :mobile_device?
end
