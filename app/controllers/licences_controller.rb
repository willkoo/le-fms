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
    company_profile = CompanyProfile.find(params[:licence][:company_profile])
    franchise = Franchise.find(params[:licence][:franchise])
    licence = Licence.new(licence_params)
    licence.company_profile = company_profile
    licence.franchise = franchise
    licence.licence_status = "pending"

    if licence.save
      redirect_to licences_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @licence.update(licence_params)
    redirect_to licences_path()
  end

  private

  def licence_params
    params.require(:licence).permit(:company_profile_id, :franchise_id, :licence_status, :proposed_location, :proposal)
  end

  def find_licences
    @licence = Licence.find(params[:id])
  end
end
