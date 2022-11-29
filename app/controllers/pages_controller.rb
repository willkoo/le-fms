class PagesController < ApplicationController
  def training
    @licences = Licence.all
  end
end
