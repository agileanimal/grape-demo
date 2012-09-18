require 'grape'

class GrapeDemoAPI < Grape::API
  prefix 'api'
  version 'v1', :using => :path
    
  namespace :info do
    desc "Provides information about the API"
    get do
      { api:"Grape Demo API", version: version }
    end
  end
    
  namespace :users do
    desc "A list of the last 100 users"
    get do
      users = User.last(100)
      present users, with: User::Entity
    end

    desc "Returns the user determined by the specified id."
    params do
      requires :id, type: Integer, desc: "The ID of the user."
    end
    get ":id" do
      id = params[:id]
      user = User.where(id: id).first
      not_found! if user.nil?
      present user, with: User::Entity
    end
    
    desc "Creates a pet for a give user."
    params do
      requires :id, type: Integer, desc: "The ID of the user."
      requires :name, type: String, desc: "The name of the pet."
    end
    post ":id/pets" do
      id = params[:id]
      user = User.where(id: id).first
      invalid_request!("User does not exist") if user.nil?
      present user.pets.create(name: params[:name]), with: Pet::Entity
    end
  end
  
end