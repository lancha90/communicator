class Call < ActiveRecord::Base
  
  #Atributos del modelo
  attr_accessible :close, :hours_total, :hours_week, :opening, :profile, :title, :work, :sort
end
