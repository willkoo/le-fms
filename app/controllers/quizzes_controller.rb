class QuizzesController < ApplicationController
  before_action :find_quizzes, only: [:show]
  def index
    @quizzes = Quiz.all
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def create
  end

  private

  def quiz_params
    params.require(:quiz).permit(:quiz_name, :video_url, :video_completed, :franchise_id)
  end

  def find_quizzes
    @quiz = Quiz.find(params[:id])
  end
end
