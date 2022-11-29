class LicenceCommentsController < ApplicationController
  before_action :find_licence_comment
  def index
  end

  def show
  end

  def new
    @licence_comment = LicenceComment.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

private

  def find_licence_comment
  end

  def licence_comment_params
  end
end
