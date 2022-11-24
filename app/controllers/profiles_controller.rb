class ProfilesController < ApplicationController
  before_action :find_profiles, only: [:show, :edit, :update]
  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_number, :description, :country)
  end

  def find_profiles
    @profile = Profile.find(params[:id])
  end
end
