class QuizAttemptsController < ApplicationController
  before_action :find_attempt, only: [:show]

  def index
    @licence = Licence.find(params[:licence_id])
    @attempts = QuizAttempt.all.where(licence_id: @licence)
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def attempt_params
    params.require(:quiz_attempt).permit(:licence_id, :quiz_id, :passed)
  end

  def find_attempt
    @attempt = QuizAttempt.find(params[:id])
  end
end
