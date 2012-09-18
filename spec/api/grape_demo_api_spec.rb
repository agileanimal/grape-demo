require "spec_helper"
require "rack/test"

API_PATH = "/api/v1/"

# app method is needed for rack-test
def app
  GrapeDemo::Application
end

describe "APIv1  Methods" do
  include Rack::Test::Methods
  fixtures :all  
  
  it "returns the info about the API when requested" do
    get "/api/v1/info", nil, {}
    last_response.body.should == 
      { 
        api:"Grape Demo API",
        version:"v1"
      }.to_json
    last_response.status.should == 200
  end
  
  context "Users" do
    it "returns a list of users" do
      get "api/v1/users/", {}
      last_response.body.should == User::Entity.represent(User.all).to_json
      last_response.status.should == 200
    end
  
    it "finds a user by their id" do
      mark = users(:mark)
      get "api/v1/users/#{mark.id}", {}
      last_response.body.should == User::Entity.represent(mark).to_json
      last_response.status.should == 200
    end
    
    it "returns 404, not found if there is no user with a given id" do
      get "api/v1/users/1337", {}
      last_response.body.should == "{\"error\":\"Not Found\"}"
      last_response.status.should == 404
    end
  end
end