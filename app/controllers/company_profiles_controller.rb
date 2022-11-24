class CompanyProfilesController < ApplicationController
  before_action :find_company_profiles, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def company_profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_number, :description, :country)
  end

  def find_company_profiles
    @profile = Profile.find(params[:id])
  end
end
