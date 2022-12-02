class PagesController < ApplicationController

def hello_sign
  render json: {
    success: true
  }
end

end
