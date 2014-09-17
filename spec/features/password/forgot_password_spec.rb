require "spec_helper"

describe "Forgot password", type: :feature do

  #Clean e-mail array
  before { ActionMailer::Base.deliveries = [] }

  let(:user) { create(:user) }

  it "Request a new password" do

    visit "/users/sign_in"

    click_link t("devise.sessions.new.forgot_password")

    fill_in "user_email", with: user.email
    click_on "reset_password"

    #Should display success message
    expect(page).to have_content(t("devise.passwords.created.heading"))
    #Should has sent 1 email 
    ActionMailer::Base.deliveries.count == 1
    #Should has the correct subject
    ActionMailer::Base.deliveries[0].subject == t("devise.mailer.reset_password_instructions.subject")
  end

end
