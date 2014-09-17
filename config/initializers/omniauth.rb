OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '475931652701-lg031h8jec91k1ma3g92af7uqgc0ivco.apps.googleusercontent.com', 'l2qcUIohrsOtQbYHDSGqrPfN', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end