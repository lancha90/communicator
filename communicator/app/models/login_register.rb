class LoginRegister < ActiveRecord::Base
  #Relación con el modelo user
  belongs_to :user
  #Atributos del modelo
  attr_accessible :user
end
