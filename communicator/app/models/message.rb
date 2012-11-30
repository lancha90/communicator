class Message < ActiveRecord::Base
  
  #Relación con el modelo users
  belongs_to :user
  #Relación con el modelo dependences
  belongs_to :dependence
  
  #Atributos del modelo
  attr_accessible :subject, :content, :dependence, :user
end
