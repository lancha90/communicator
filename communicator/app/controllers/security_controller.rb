class SecurityController < ApplicationController
  
  def login

    @nombre = params[:username]
    @passwd = params[:passwd]

    redirect_to action: :verifyLogin, nombre: @nombre, passwd: @passwd
  end

  def verifyLogin

    ##@usuario = User.where("username = ? AND password = ?", params[:nombre], params[:passwd])

    @username = params[:nombre]
    @passwd = params[:passwd]

    @usuario = User.find(:all,:conditions => {:username =>@username , :password =>@passwd},:limit => 1)

    if @usuario.length > 0
      logger.info { "[LOGIN - OK] - El usuario #{@username} inicio sesion correctamente" }
      LoginRegister.create(:user=>@usuario[0])
      email_sent
      render json: {response:'OK'}


    else
      render json: {response:'FALSE'}
      logger.info { "[LOGIN - ERROR] - El usuario #{@username} inicion sesion" }
    end

  end

  def email_sent
    SendNew::sendRegister('mao_0627@hotmail.com').deliver
  end

end
