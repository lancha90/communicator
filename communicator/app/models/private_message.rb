class PrivateMessage < ActiveRecord::Base
  #Relación con el modelo users
  belongs_to :user
  #Atributos del modelo
  attr_accessible :content, :subject, :user
end
