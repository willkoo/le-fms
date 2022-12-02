class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:hello_sign]
  skip_before_action :verify_authenticity_token

  def hello_sign
    render plain: "Hello API Event Received.", status: 200
  end

end
