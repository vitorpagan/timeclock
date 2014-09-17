FactoryGirl.define do

  factory :user do
    name "User 1"
    email "user1@example.com"
    password { User.new.send(:password_digest, 'Bio@1234') }
  end

end


