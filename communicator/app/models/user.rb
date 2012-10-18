class User < ActiveRecord::Base
  attr_accessible :code, :dependence, :email, :firtname, :password, :rol, :secondname, :username
end
