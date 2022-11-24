class CompanyProfilesController < ApplicationController
  before_action :find_company_profiles, only: [:show, :edit, :update]

  def index
    @company_profiles = CompanyProfile.all
  end

  def show
    @company_records = CompanyRecord.find_by(company_profile_id: params[:id])
  end

  def new
    @company_profile = CompanyProfile.new
  end

  def create
  end

  def edit
  end

  def update
    @company_profile.update(company_profile_params)
    redirect_to company_profile_path(@company_profile)
  end

  private

  def company_profile_params
    params.require(:company_profile).permit(:name, :uen, :address, :profile, :url, :verified)
  end

  def find_company_profiles
    @company_profile = CompanyProfile.find(params[:id])
  end
end
