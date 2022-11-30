class QuizAnswersController < ApplicationController
  before_action :find_answers, only: %i[show]
  # before_action :find_attempt

  def index
    @quiz_answers = QuizAnswer.all
  end

  def show
  end

  def new
    @quiz_answer = QuizAnswer.new
  end

  def create
    quiz_attempt = QuizAttempt.find(params[:quiz_attempt_id])
    quiz_question = QuizQuestion.find(params[:quiz_answer][:quiz_question])
    raise
    quiz_option = QuizQuestion.find(params[:quiz_answer][:quiz_option])
    @quiz_answer = QuizAnswer.new(answer_params)
    @quiz_answer.quiz_attempt = quiz_attempt
    @quiz_answer.quiz_question = quiz_question
    @quiz_answer.quiz_option = quiz_option

    if @quiz_answer.save
      redirect_to quiz_attempt_path(quiz_attempt_id: @quiz_attempt_id)
    else
      render "quiz_attempts/show", status: :unprocessable_entity
    end
  end

  def answer_all

  end

  private

  def answer_params
    params.require(:quiz_answer).permit(:quiz_question_id, :quiz_attempt_id, :quiz_option_id)
  end

  # def find_attempt
  #   @quiz_attempt = QuizAttempt.find(params[:quiz_attempt_id])
  # end
end
