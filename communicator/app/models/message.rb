class Message < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :dependence
  
  attr_accessible :subject, :content, :dependence, :user
end
