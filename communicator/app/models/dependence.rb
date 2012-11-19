class Dependence < ActiveRecord::Base
  
  has_many :messages, :dependent => :destroy
  has_many :users, :dependent => :destroy
  has_many :news, :dependent => :destroy
  
  attr_accessible :information, :mision, :name, :vision
end
