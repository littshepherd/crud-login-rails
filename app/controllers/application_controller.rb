class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user
  before_action :protect_pages
  private
  def set_current_user
    Current.user = Person.find_by(id: session[:user_id])
  end
  def protect_pages
    redirect_to "/login" if Current.user.nil?
  end
  def admin_only
    redirect_to "/people" if Current.user.nil? || Current.user.role.id != 1
  end
end
