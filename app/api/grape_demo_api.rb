require 'grape'

class GrapeDemoAPI < Grape::API
  prefix 'api'
  version 'v1', :using => :path
    
  namespace :info do
    get do
      { api:"Grape Demo API", version: version }
    end
  end
    
  namespace :users do
    get do
      users = User.last(100)
      present users, with: User::Entity
    end

    get ":id" do
      id = params[:id]
      user = User.where(id: id).first
      present user, with: User::Entity
    end
  end
  
end