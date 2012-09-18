require 'grape'

class GrapeDemoAPI < Grape::API
  prefix 'api'
  version 'v1', :using => :path
    
  namespace :info do
    get do
      { api:"Grape Demo API", version: version }
    end
  end
  
end