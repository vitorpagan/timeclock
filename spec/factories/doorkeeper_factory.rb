FactoryGirl.define do

  factory :application, class: Doorkeeper::Application do
    name "Application1"
    uid "app"
    secret "123456"
    redirect_uri "http://example.com"
  end

end
