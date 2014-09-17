require "spec_helper"

describe "Login user", type: :feature do

  let(:user) { create(:user) }

  it "with email and password successful" do

    visit "/users/sign_in"
    fill_in "E-mail", :with => user.email
    fill_in "Senha", :with => user.password

    click_on "sign_in"

    expect(page).to have_content "#{t('home.index.logged_with')} #{user.email}"
  end

end
