class User < ActiveRecord::Base
  include Grape::Entity::DSL

  devise :database_authenticatable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :birthday

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
  has_many :pets
  
  entity :email, :name do
    expose :pets, using: Pet::Entity
  end
    
  def name 
    "#{first_name} #{last_name}"
  end
  
end
