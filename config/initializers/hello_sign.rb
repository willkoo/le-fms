require 'hello_sign'
HelloSign.configure do |config|
  config.api_key = '23b3e3cc02391d49e19b60f7309a8b837b605e5520877ad6e5cce6d42e5a92af'
  # You can use email_address and password instead of api_key. But api_key is recommended
  # If api_key, email_address and password are all present, api_key will be used
  # config.email_address = 'email_address'
  # config.password = 'password'
end
