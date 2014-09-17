require "spec_helper"

describe Company, type: :feature do
  let(:user) do
    create(:user)
  end

  before(:each) do
    sign_in
  end

  describe 'New' do
    let(:attributes) { attributes_for(:company) }

    it "with success" do
      visit "/companies/new"

      fill_in "company_identifier", with: attributes[:identifier]
      fill_in "company_social_name", with: attributes[:social_name]
      fill_in "company_comercial_name", with: attributes[:comercial_name]
      fill_in "company_zipcode", with: attributes[:zipcode]
      fill_in "company_number", with: attributes[:number]
      fill_in "company_complement", with: attributes[:complement]

      # just to test while the search by zip code isn't completed

      fill_in "company_country", with: attributes[:country]
      fill_in 'company_address', with: attributes[:address]
      fill_in 'company_district', with: attributes[:district]
      fill_in 'company_city', with: attributes[:city]
      fill_in 'company_state', with: attributes[:state]

      # Validation of Zipcode
      expect(page).to have_field('company_address', with: attributes[:address])
      expect(page).to have_field('company_district', with: attributes[:district])
      expect(page).to have_field('company_city', with: attributes[:city])
      expect(page).to have_field('company_state', with: attributes[:state])

      click_on t("companies.form.create_company")

      expect(page).to have_content t("companies.create.notice")
      
      visit logs_company_path
      expect(page).to have_content t("activerecord.attributes.log.actions.company_created")
    end

    it "with error" do
      visit "/companies/new"

      fill_in "company_identifier", with: attributes[:identifier]

      click_on t("companies.form.create_company")

      expect(page).to_not have_content t("companies.create.notice")

      visit logs_company_path
      expect(page).to_not have_content t("activerecord.attributes.log.actions.company_created")
    end
  end

  describe 'Edit' do
    let!(:company) { create(:company) }

    it "with success" do
      visit edit_company_path(company)
      expect(page).to have_field('company_comercial_name', with: company[:comercial_name])

      new_comercial_name = "New #{company[:comercial_name]}"
      fill_in 'company_comercial_name', with: new_comercial_name
      click_on t("companies.form.update_company")
      
      expect(page).to have_content t("companies.update.notice")
      expect(page).to have_field('company_comercial_name', with: new_comercial_name)

      visit logs_company_path
      expect(page).to have_content t("activerecord.attributes.log.actions.company_updated")
    end

    it "with error" do
      visit edit_company_path(company)
      expect(page).to have_field('company_comercial_name', with: company[:comercial_name])

      new_comercial_name = ""
      fill_in 'company_comercial_name', with: new_comercial_name
      click_on t("companies.form.update_company")
      
      expect(page).to_not have_content t("companies.update.notice")

      visit logs_company_path
      expect(page).to_not have_content t("activerecord.attributes.log.actions.company_updated")
    end
  end
end
