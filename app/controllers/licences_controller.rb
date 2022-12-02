class LicencesController < ApplicationController
  before_action :find_licences, only: [:show, :edit, :update]

  def index
    @licences = Licence.all
  end

  def show
    @company_profile = @licence.company_profile
    if @licence.licence_status == "approved"
      @attempt = QuizAttempt.new(licence_id: @licence.id, quiz_id: @licence.franchise.quizzes.first)
      @attempt.save
    end

    # get your account
    my_account = HelloSign.get_account

    # get your signature requests
    my_signature_requests = HelloSign.get_signature_requests

    client = HelloSign::Client.new :api_key => '23b3e3cc02391d49e19b60f7309a8b837b605e5520877ad6e5cce6d42e5a92af'
    client.create_embedded_signature_request(
        :test_mode => 1,
        :client_id => '',
        :subject => 'My First embedded signature request',
        :message => 'Awesome, right?',
        :signers => [
          {
              :email_address => 'lester.wee.68@gmail.com',
              :name => 'Me'
          }
        ],
        :file_urls => ['https://res.cloudinary.com/denywg8cy/image/upload/5qzbpst0o6v18i1yhuue6z4nijb4.pdf']
      )
    client.get_embedded_sign_url signature_id: 'SIGNATURE_ID'
  end

  def new
    @licence = Licence.new
  end

  def create
    company_profile = CompanyProfile.find(params[:licence][:company_profile])
    franchise = Franchise.find(params[:licence][:franchise])
    licence = Licence.new(licence_params)
    licence.company_profile = company_profile
    licence.franchise = franchise
    licence.licence_status = "pending"

    if licence.save
      redirect_to licences_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @licence.update(licence_params)
    redirect_to licences_path()
  end

  private

  def licence_params
    params.require(:licence).permit(:company_profile_id, :franchise_id, :licence_status, :proposed_location, :proposal)
  end

  def find_licences
    @licence = Licence.find(params[:id])
  end
end
