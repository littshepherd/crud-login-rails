class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user
  before_action :protect_pages
  private
  def set_current_user
    Current.user = Person.find_by(id: session[:user_id])
    if Current.user
      Current.profile = Profile.find_by(person_id: Current.user.id)
    end
  end
  def protect_pages
    redirect_to "/login" if Current.user.nil?
  end
  def admin_only
    redirect_to "/people" if Current.user.nil? || Current.profile.role.name != "admin"
  end
end
