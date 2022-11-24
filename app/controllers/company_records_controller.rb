class CompanyRecordsController < ApplicationController
  before_action :find_company_records, only: [:show, :edit, :update]

  def index
    @company_records = CompanyRecord.all
  end

  def show
  end

  def create
    @company_records = CompanyRecord.new
  end

  def new
  end

  def edit
  end

  def update
    @company_record.update(company_record_params)
    redirect_to company_record_path(@company_record)
  end

  def destroy
  end

  private

  def company_record_params
    params.require(:company_record).permit(:company_profile, :paid_up_capital, :last_fy_revenue, :legal_disputes)
  end

  def find_company_records
    @company_record = CompanyRecord.find(params[:id])
  end
end
