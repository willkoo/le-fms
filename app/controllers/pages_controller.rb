class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:hello_sign]
  skip_between_action :verify_authenticity_token

  def hello_sign
    render json: {
      success: true
    }
  end

end
