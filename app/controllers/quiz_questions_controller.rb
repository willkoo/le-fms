class QuizQuestionsController < ApplicationController
  def index
    @quiz = Quiz.find(params[:quiz_id])
    @questions = QuizQuestion.all.where(quiz_id: @quiz)
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = QuizQuestion.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @quiz_question = QuizQuestion.new(question_params)
    @quiz_question.quiz = @quiz

    if @quiz_question.save
      redirect_to quiz_quiz_questions_path(quiz_id: @quiz.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:quiz_question).permit(:question, :quiz_id)
  end
end
