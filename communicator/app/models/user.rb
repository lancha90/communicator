class User < ActiveRecord::Base
  
  has_many :login_registers, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  
  has_many :private_messages, :dependent => :destroy
  has_many :private_messages, :dependent => :destroy
  
  belongs_to :dependence

  attr_accessible :id, :code, :dependence, :email, :firtname, :password, :rol, :secondname, :username, :dependence
end


#HACER SCAFFOLD DE LAS NOTICIAS