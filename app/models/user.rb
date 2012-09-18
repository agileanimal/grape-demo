class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :last_name

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
  def name 
    "#{first_name} #{last_name}"
  end
  
end
