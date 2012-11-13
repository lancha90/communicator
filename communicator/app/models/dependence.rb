class Dependence < ActiveRecord::Base
  
  has_many :messages, :dependent => :destroy
  
  attr_accessible :information, :mision, :name, :vision
end
