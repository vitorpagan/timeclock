module FeaturesHelper

  def t(key, args = {})
    I18n.t(key, args)
  end

  def sign_in
    visit "/users/sign_in"
    fill_in "E-mail", with: user.email
    fill_in "Senha", with: user.password
    click_on "sign_in"
  end
end
