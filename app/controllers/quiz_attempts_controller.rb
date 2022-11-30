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
    @quiz = Quiz.find(params[:quiz_id])
    @licence = Licence.find(params[:licence_id])

    successful_attempt = QuizAttempt.find_by(
      licence: @licence,
      quiz: @quiz,
      status: "pass"
    )

    if (successful_attempt.present?)
      redirect_to trainings_path
    else
      @quiz_attempt = QuizAttempt.find_or_create_by(
        licence: @licence,
        quiz: @quiz,
        status: "pending"
      )
      # @quiz_attempt.video_completed = true
      if @quiz_attempt.save
        pp @quiz_attempt
      else
        pp @quiz_attempt.errors.full_messages
      end
    end
  end

  def create
    @quiz_attempt = QuizAttempt.create!(attempt_params)

    if @quiz_attempt.save
      redirect_to trainings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def complete
    @quiz = Quiz.find(params.dig(:submission, :quiz_id))
    @licence = Licence.find(params.dig(:submission, :licence_id))

    pp "FOUND QUIZ #{@quiz.id} WITH LICENCE #{@licence.id}"
    correct_count = 0

    # map user choice (answer) to each correct_option
    @quiz.quiz_questions.each do |question|
      pp "QUESTION #{question.id}"
      user_choice = params.dig(:submission, :answers, question.id.to_s)
      pp "USER CHOSE #{user_choice}"
      correct_option = question.quiz_options
      .find_by(correct_answer: "t")
      pp "CORRECT OPTION #{correct_option.id}"

      # if user_choice == correct_option, correct_count += 1
      correct_count += 1 if user_choice.to_s == correct_option.id.to_s
    end

    pp "CORRECT: #{correct_count}"

    # Criteria to pass is to get the correct answer for all questions.
    # if correct_count is the same as total number of questions, status will change to pass.
    if correct_count == @quiz.quiz_questions.count
      @quiz_attempt = QuizAttempt.find_by(
        licence: @licence,
        quiz: @quiz,
        status: "pending"
      )
      pp @quiz_attempt
      @quiz_attempt.status = "pass"
      @quiz_attempt.save
      redirect_to licence_quiz_path(@licence, @quiz, :success => true)
    else
      redirect_to licence_quiz_path(@licence, @quiz, :failed => true)
    end
  end

  private

  def attempt_params
    params.require(:quiz_attempt).permit(:licence_id, :quiz_id, :status)
  end

  def find_attempt
    @quiz_attempt = QuizAttempt.find(params[:id])
  end
end
