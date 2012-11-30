class User < ActiveRecord::Base
  #Relacion con el modelo login_register
  has_many :login_registers, :dependent => :destroy
  #Relacion con el modelo messages
  has_many :messages, :dependent => :destroy
  #Relacion con el modelo dependences
  has_many :private_messages, :dependent => :destroy
  #Relacion con el modelo dependences
  belongs_to :dependence

  #Atributos del modelo
  attr_accessible :id, :code, :dependence, :email, :firtname, :password, :rol, :secondname, :username, :dependence
end