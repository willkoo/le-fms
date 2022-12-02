class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:hello_sign]
  def hello_sign
    render json: {
      success: true
    }
  end

end
