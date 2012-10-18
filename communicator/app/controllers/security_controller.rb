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

    @nombre = params[:nombre]
    @passwd = params[:passwd]

    logger.info { 'esta es la prueba '+@nombre+' '+@passwd }

    if @nombre == @passwd
      render json: {response:'OK'}
    else
      render json: {response:'FALSE'}
    end

  end

end
