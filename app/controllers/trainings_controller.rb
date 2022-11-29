class TrainingsController < ApplicationController
  def index
    @licences = Licence.all
  end

  def show
  end
end
