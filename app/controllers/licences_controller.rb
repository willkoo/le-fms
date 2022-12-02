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

  def sign_contract
    @licence = Licence.find(params[:id])
    @contract_url = licence.contract_url
  end

  def create_contract
    #  my_account = HelloSign.get_account => get your account
    #  my_signature_requests = HelloSign.get_signature_requests => get your signature requests
    client = HelloSign::Client.new :api_key => '23b3e3cc02391d49e19b60f7309a8b837b605e5520877ad6e5cce6d42e5a92af'

    result = client.create_embedded_signature_request(
      test_mode: 1,
      client_id: '68b070fa041d68446a913955fcbee0dc',
      subject: 'My Test Email',
      message: 'Cool hor?',
      signers: [
        {
            :email_address => 'lester.wee.68@gmail.com',
            :name => 'Me'
        }
      ],
      :file_urls => ['https://res.cloudinary.com/denywg8cy/image/upload/5qzbpst0o6v18i1yhuue6z4nijb4.pdf']
    )
    signature_id = result.data.dig("signatures")[0].data.dig("signature_id")

    @contract_url = client.get_embedded_sign_url signature_id: signature_id
    @contract_url = @contract_url.data["sign_url"]

    @licence = Licence.find(params["licence_id"])
  end

  def hello_sign
    licence = Licence.find()
    licence.signed_contract = true
    licence.save

    render plain: "Hello API Event Received.". status: 200
  end

  private

  def licence_params
    params.require(:licence).permit(:company_profile_id, :franchise_id, :licence_status, :proposed_location, :proposal)
  end

  def find_licences
    @licence = Licence.find(params[:id])
  end
end
