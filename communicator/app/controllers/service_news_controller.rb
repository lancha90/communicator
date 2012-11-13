class ServiceNewsController < ApplicationController
  
  # Metodo encargado de realizar la consulta a la base de datos del numero de noticias disponibles segun su perfil
  def showNumber

    @numberNews= User.find(:all,:conditions => {:username =>@username , :password =>@passwd},:limit => 1)

  end

  def showNews

  end

  def showAll

  end

end
