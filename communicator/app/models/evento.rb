class Evento < ActiveRecord::Base
  #Atributos del modelo
  attr_accessible :descripcion, :nombre
end
