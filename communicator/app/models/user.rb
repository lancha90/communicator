class User < ActiveRecord::Base
  
  has_many :login_registers, :dependent => :destroy

  attr_accessible :code, :dependence, :email, :firtname, :password, :rol, :secondname, :username
end
