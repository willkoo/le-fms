class LicencesController < ApplicationController
  before_action :find_licences, only: [:show, :edit, :update]

  def index
    @licences = Licence.all
  end

  def show
  end

  def new
    @licence = Licence.new
  end

  def create
    company_profile = CompanyProfile.find(params[:company_profile_id])
    franchise = Franchise.find(params[:franchise_id])
    licence = Licence.new(licence_params)
    licence.company_profile = company_profile
    licence.franchise = franchise

    if licence.save
      redirect_to licence_path(company_profile_id: company_profile, franchise_id: franchise)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @licence.update(licence_params)
    partner = Partner.new(licence_id: @licence.id, franchise_id: @licence.franchise_id, operational_status: "training")
    partner.save
    redirect_to licences_path()
  end

  private

  def licence_params
    params.require(:licence).permit(:company_profile_id, :franchise_id, :licence_status)
  end

  def find_licences
    @licence = Licence.find(params[:id])
  end
end
