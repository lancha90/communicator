class News < ActiveRecord::Base
  #Relación con el modelo dependences
  belongs_to :dependence
  
  #Atributos del modelo
  attr_accessible :admin, :description, :student, :teacher, :title, :validity, :dependence
end
