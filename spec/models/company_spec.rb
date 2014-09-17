require 'spec_helper'

describe Company do

  context "validations" do

    #TODO: VALIDATE IDENTIFIER
    it { expect(subject).to validate_presence_of :social_name }
    it { expect(subject).to validate_presence_of :comercial_name }
    it { expect(subject).to validate_presence_of :zipcode }
    it { expect(subject).to validate_presence_of :address }
    it { expect(subject).to validate_presence_of :number }
    it { expect(subject).to validate_presence_of :district }
    it { expect(subject).to validate_presence_of :city }
    it { expect(subject).to validate_presence_of :state }
    it { expect(subject).to validate_presence_of :country }

    context "cnpj" do
      it {expect(subject).to allow_value("83.711.593/0001-21").for(:identifier)}
      it {expect(subject).to_not allow_value("83.711.593/0001-40").for(:identifier)}
    end

    context "cnpj uniqueness" do
      before{create :company}
      it {expect(subject).to validate_uniqueness_of(:identifier)}
    end

  end

end
