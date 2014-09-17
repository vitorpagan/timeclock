# https://github.com/doorkeeper-gem/doorkeeper/wiki/Using-Resource-Owner-Password-Credentials-flow

require "spec_helper"

describe "OAuth2 authentication", type: :feature do

  let(:app)  { create(:application) }
  let(:user) { create(:user) }

  it 'auth ok' do
    client = OAuth2::Client.new(app.uid, app.secret, :site => "http://example.com") do |b|
      b.request :url_encoded
      b.adapter :rack, Rails.application
    end
    token = client.password.get_token(user.email, user.password)
    expect(token).to_not be_expired
  end

  it 'auth nok' do
    client = OAuth2::Client.new(app.uid, app.secret) do |b|
      b.request :url_encoded
      b.adapter :rack, Rails.application
    end
    expect { client.password.get_token(user.email, "123") }.to raise_error(OAuth2::Error)
  end
end
