class CompanyCommentsController < ApplicationController
  before_action :find_company_comment, only: [:show, :edit, :update]

  def index
    @company_comments = CompanyComment.all
  end

  def show
  end

  def new
    @company_comment = CompanyComment.new
  end

  def edit
  end

  def create
  end

  def update
    @company_comment.update(company_comment_params)
    redirect_to company_profile_path(@company_profile)
  end

  def destroy
  end

  private

  def find_company_comment
    @company_comment = CompanyComment.find(params[:id])
  end

  def company_comment_params
    params.require(:company_comment).permit(:content, :company_profile_id)
  end
end
