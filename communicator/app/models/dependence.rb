class Dependence < ActiveRecord::Base
  
  #Relación con el modelo message
  has_many :messages, :dependent => :destroy
  #Relación con el modelo users
  has_many :users, :dependent => :destroy
  #Relación con el modelo news
  has_many :news, :dependent => :destroy
  
  #Atributos del modelo
  attr_accessible :information, :mision, :name, :vision
end
