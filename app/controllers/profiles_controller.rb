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
  end

  def destroy
  end

  private

  def find_profiles
    @profile = Profile.find(params[:id])
  end

  def profile_params
  end
end
