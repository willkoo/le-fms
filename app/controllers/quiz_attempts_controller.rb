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
    video_completed = true
    unless video_completed
      redirect_to root_path
      return
    end

    @quiz = Quiz.find(params[:quiz_id])
    @licence = Licence.find(params[:licence_id])

    successful_attempt = QuizAttempt.find_by(
      licence: @licence,
      quiz: @quiz,
      passed: true
    )

    if (successful_attempt.present?)
      redirect_to root_path
    else
      @quiz_attempt = QuizAttempt.first_or_create(
        licence: @licence,
        quiz: @quiz,
        # status: "failed"
      )

      @quiz_attempt.video_completed = true
      @quiz_attempt.save
    end
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

  def complete
    @quiz = Quiz.find(params.dig(:submission, :quiz_id))
    @licence = Licence.find(params.dig(:submission, :licence_id))

    pp "FOUND QUIZ #{@quiz.id} WITH LICENCE #{@licence.id}"
    correct_count = 0

    @quiz.quiz_questions.each do |question|
      pp "QUESTION #{question.id}"
      user_choice = params.dig(:submission, :answers, question.id.to_s)
      pp "USER CHOSE #{user_choice}"
      correct_option = question.quiz_options
      .find_by(correct_answer: "t")
      pp "CORRECT OPTION #{correct_option.id}"

      correct_count+=1 if user_choice.to_s == correct_option.id.to_s
    end

    pp "CORRECT: #{correct_count}"

    if correct_count == @quiz.quiz_questions.count
      @quiz_attempt = QuizAttempt.find_by(
        licence: @licence,
        quiz: @quiz,
        passed: false
        # status: "IN PROGRESS"
      )
      @quiz_attempt.passed = true
      @quiz_attempt.save

      redirect_to root_path
    else
      redirect_to licence_quiz_path(@licence, @quiz)
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
