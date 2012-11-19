class PrivateMessage < ActiveRecord::Base
  belongs_to :from_id
  belongs_to :to_id
  
  attr_accessible :content, :from_id, :subject, :to_id
end
