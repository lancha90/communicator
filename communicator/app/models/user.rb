class User < ActiveRecord::Base
  
  has_many :login_registers, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  attr_accessible :id, :code, :dependence, :email, :firtname, :password, :rol, :secondname, :username
end


#HACER SCAFFOLD DE LAS NOTICIAS