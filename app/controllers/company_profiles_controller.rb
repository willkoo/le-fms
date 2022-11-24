class CompanyProfilesController < ApplicationController
  before_action :find_company_profiles, only: [:show, :edit, :update]

  def index
    @company_profiles = CompanyProfile.all
  end

  def show
  end

  def new
    @company_profile = CompanyProfile.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def company_profile_params
    params.require(:company_profile).permit(:name, :uen, :address, :profile, :website, :verified)
  end

  def find_company_profiles
    @company_profile = CompanyProfile.find(params[:id])
  end
end
