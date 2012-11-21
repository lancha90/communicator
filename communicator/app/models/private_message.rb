class PrivateMessage < ActiveRecord::Base
  
  belongs_to :user
  
  attr_accessible :content, :subject, :user
end
