class ProfilesController < ApplicationController
  before_action :admin_only, only: %i[ edit update index  ]
  def index
    @profiles = Profile.all
  end

  def show
    @profiles = Profile.find(params[:id])
  end
  def edit
    @profile= Profile.find(params[:id])
    @roles= Role.all
  end

  def update
    @profile = Profile.find(params[:id])
    puts "Profile params: #{@profile}"
    if @profile.update(profile_params)
      redirect_to "/profiles"
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:role_id)
  end
end
