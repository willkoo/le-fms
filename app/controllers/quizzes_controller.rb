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
    franchise = Franchise.find(params[:quiz][:franchise])
    quiz = Quiz.new(quiz_params)
    quiz.franchise = franchise
    quiz.video_completed = false

    if quiz.save
      redirect_to_quizzes_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:quiz_name, :video_url, :video_completed, :franchise_id)
  end

  def find_quizzes
    @quiz = Quiz.find(params[:id])
  end
end
