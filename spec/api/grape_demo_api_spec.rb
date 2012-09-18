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
end