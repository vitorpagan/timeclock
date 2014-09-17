require "spec_helper"

describe User do

  context "password complexity" do

    it { expect(subject).to allow_value("Teste1234#").for(:password) }
    it { expect(subject).to_not allow_value("123456").for(:password) }

  end

end
