class FranchisesController < ApplicationController
  before_action :find_franchises, only: [:show, :edit, :update]

  def index
    @franchises = Franchise.all
  end

  def show
  end

  def new
    @franchise = Franchise.new
  end

  def create
    franchise = Franchise.new(franchise_params)
    franchise.user = current_user
    franchise.save
    redirect_to franchise_path(franchise)
  end

  def edit
  end

  def update
    @franchise.update(franchise_params)
    redirect_to franchise_path(@franchise)
  end

  def destroy
  end

  private

  def franchise_params
    params.require(:franchise).permit(:name, :description, :url)
  end

  def find_franchises
    @franchise = Franchise.find(params[:id])
  end
end
