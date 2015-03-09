require 'spec_helper'

describe Accredible do
  describe '.request("post", "http://www.accredible.com")' do
    it "should raise an exxeption of no api when api_key not declared" do
      expect {Accredible.request("post", "www.example.com")}.to raise_error #AuthenticationError
    end

    it "should not raise error when api key declared" do
      Accredible.api_key = "example_key"
      expect(Accredible.request("post", "www.example.com")).to eq("everything fine")
    end
  end
end