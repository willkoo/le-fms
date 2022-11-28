class PartnersController < ApplicationController
  before_action :find_partners, only: [:show, :edit, :update]

  def index
    @partners = Partner.all
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  def create
    licence = Licence.find(params[:licence_id])
    franchise = Franchise.find(params[:franchise_id])
    partner = Partner.new(partner_params)
    partner.licence = licence
    partner.franchise = franchise
    partner.operational_status = "training"

    if partner.save
      redirect_to partner_path(licence_id: licence, franchise_id: franchise)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  private

  def partner_params
    params.require(:partner).permit(:licence_id, :franchise_id, :operational_status)
  end

  def find_partners
    @partner = Partner.find(params[:id])
  end
end
