class TrainingsController < ApplicationController
  def index
    @licences = Licence.all
    @licenses = @licences.where(user: current_user) unless current_user.admin?
  end

  def show
  end
end
