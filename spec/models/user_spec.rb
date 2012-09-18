require 'spec_helper'

describe User do
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  
  it "should have a name that is their first and last name" do
    user = User.new(:first_name => "Mark", :last_name => "Madsen")
    user.name.should == "Mark Madsen"
  end
end
