require 'spec_helper'

describe "Index", :type => :controller do

  before(:all) do
    FactoryGirl.create(:user)
  end

  describe "redirect logic" do
    it "should redirect if the user is logged in" do
      #use this format to access a session using rspec
      get '/', {}, 'rack.session' => {id: 1}
      expect(last_response.status).to eq(302)
    end

    it "should keep the user on the login page if not logged in" do
      get'/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("sign up")
    end
  end
end
