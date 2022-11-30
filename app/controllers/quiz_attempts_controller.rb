class QuizAttemptsController < ApplicationController
  before_action :find_attempt, only: %i[show]

  def index
    @quiz_attempts = QuizAttempt.all
  end

  def show
    @quiz_answer = QuizAnswer.new
    @quiz_answer.quiz_attempt = @attempt
  end

  def new
    @quiz = Quiz.find(params[:id])
    @quiz_attempt = QuizAttempt.new
  end

  def create
    @quiz_attempt = QuizAttempt.new(attempt_params)
    @quiz_attempt.passed = false

    if @quiz_attempt.save
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
    @quiz_attempt = QuizAttempt.find(params[:id])
  end
end
