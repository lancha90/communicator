class SecurityController < ApplicationController
  def login

    @nombre = params[:username]
    @passwd = params[:passwd]

    # respond_to do |format|
    # format.html
    # format.json do
    # render json: {nombre: @nombre}
    # end
    # format.xml do
    # render xml: {nombre: @nombre}
    # end
    # end

    redirect_to action: :verifyLogin, nombre: @nombre, passwd: @passwd
  end

  def verifyLogin

    ##@usuario = User.where("username = ? AND password = ?", params[:nombre], params[:passwd])     

    @usuario = User.find(:all,:conditions => {:username => params[:nombre], :password =>params[:passwd]})


    #logger.info { '[LOGIN] - El usuario '+params[:nombre]+' inicion sesion '+@usuario.user.code}

    if @usuario != nil
      render json: @usuario#{response:'OK'}
    else
      render json: @usuario#{response:'FALSE'}
    end

  end

end
