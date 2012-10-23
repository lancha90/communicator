class LoginRegister < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :user
end
