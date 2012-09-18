class Pet < ActiveRecord::Base
  include Grape::Entity::DSL
  attr_accessible :name, :user_id, :user
  
  validates_presence_of :name
  
  belongs_to :user
  
  entity :id, :name
end
