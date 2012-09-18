require 'grape'
require 'grape-swagger'

class Base < Grape::API
  # When there's an error, this is what to due, send it back as JSON
  rescue_from :all, :backtrace => false
  error_format :json
  format :json
  default_format :json
  
  # Import any helpers that you need
  helpers APIHelpers
  mount GrapeDemoAPI
  
  add_swagger_documentation markdown: true, api_version: "v1"
    
  if Rails.env.production?
    extend NewRelic::Agent::Instrumentation::Rack
  end
end
