class SecurityController < ApplicationController
  #Función encargada de ser la interaz para la conexión a la plataforma para validar el login
  def login
    @nombre = params[:username]
    @passwd = params[:passwd]
    redirect_to action: :verifyLogin, nombre: @nombre, passwd: @passwd
  end



  #Función encargada de realizar la verificación del login
  #@return 001 => Login OK
  #@return 002 => Login FALSE
  def verifyLogin

    @username = params[:nombre]
    @passwd = params[:passwd]

    ##@usuario = User.where("username = ? AND password = ?", params[:nombre], params[:passwd])
    @usuario = User.find(:all,:conditions => {:username =>@username , :password =>@passwd},:limit => 1)

    if @usuario.length > 0
      
      #Se crea un registro en el archivo de log del usuario que inicio sesion
      logger.info { "[LOGIN - OK] - El usuario #{@username} inicio sesion correctamente" }
      
      #Se crea un registro en la base de datos del login de un usuario
      LoginRegister.create(:user=>@usuario[0])
      
      #Se renderisa la pagina en formato json dependiendo la respuesta
      render json: {code:'001',user: @usuario}
      logger.info { "[LOGIN - OK] - El usuario #{@username} inicio sesion" }

    else
      
      render json: {code:'002'}
      logger.info { "[LOGIN - ERROR] - El usuario #{@username} inicio sesion" }
    end

  end

  def email_sent
    SendNew::sendRegister('mao_0627@hotmail.com').deliver
  end

end
