class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:hello_sign]
  skip_before_action :verify_authenticity_token

  def hello_sign
    render plain: "Hello API Event Received.", status: 200
  end

  def test
    client.create_embedded_signature_request(
      test_mode: 1,
      client_id: '',
      subject: 'My First embedded signature request',
      message: 'Awesome, right?',
      signers: [
        {
            :email_address => 'lester.wee.68@gmail.com',
            :name => 'Me'
        }
      ],
      :file_urls => ['https://res.cloudinary.com/denywg8cy/image/upload/5qzbpst0o6v18i1yhuue6z4nijb4.pdf']
    )
    client.get_embedded_sign_url signature_id: 'SIGNATURE_ID'
  end
end
