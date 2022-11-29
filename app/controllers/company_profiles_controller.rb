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
    company_profile = CompanyProfile.new(company_profile_params)
    company_profile.profile = current_user.profiles.first
    company_profile.status = "pending"

    if company_profile.save
      redirect_to company_profiles_path(current_user.profiles.first)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    company_profile = CompanyProfile.find(params[:id])
    # company_profile.update(company_profile_params)
    # raise
    if company_profile.update!(company_profile_params)
      # raise
      redirect_to company_profile_path(company_profile)
    end
  end

  private

  def company_profile_params
    params.require(:company_profile).permit(:name,
                                            :uen,
                                            :address,
                                            :url,
                                            :paid_up_capital,
                                            :last_fy_revenue,
                                            :legal_disputes,
                                            :status,
                                            :acra,
                                            :financial_statement,
                                            :relevant_licences)
  end

  def find_company_profiles
    @company_profile = CompanyProfile.find(params[:id])
  end
end
