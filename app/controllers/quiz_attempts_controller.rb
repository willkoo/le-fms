class QuizAttemptsController < ApplicationController
  before_action :find_attempt, only: [:show]

  def index
    @attempts = QuizAttempt.all
  end

  def show
  end

  def new
    @attempt = QuizAttempt.new
  end

  def create
    @attempt = QuizAttempt.new(attempt_params)
    @attempt.passed = false

    if @attempt.save
      redirect_to quiz_attempts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attempt_params
    params.require(:quiz_attempt).permit(:licence_id, :quiz_id, :passed)
  end

  def find_attempt
    @attempt = QuizAttempt.find(params[:id])
  end
end
