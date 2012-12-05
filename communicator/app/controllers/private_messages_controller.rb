class PrivateMessagesController < ApplicationController
  #GET /showMessageUser.json
  #Funcion encargada de obtener los mensajes de un usuario segun su id
  def getMessageUser

    @user = User.find(params[:user])
    @private_message = PrivateMessage.find(:all,:conditions => {:user_id =>@user })

    render json: {code: '200',message: @private_message}
  end

  # GET /private_messages
  # GET /private_messages.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @private_messages = PrivateMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @private_messages }
    end
  end

  # GET /private_messages/1
  # GET /private_messages/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @private_message = PrivateMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @private_message }
    end
  end

  # GET /private_messages/new
  # GET /private_messages/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  def new
    @private_message = PrivateMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @private_message }
    end
  end

  # GET /private_messages/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @private_message = PrivateMessage.find(params[:id])
  end

  # POST /private_messages
  # POST /private_messages.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create
    @private_message = PrivateMessage.new(params[:private_message])
    @user = User.find(:all,:conditions => {:id =>params[:user] },:limit => 1)

    if @user.length > 0
      @private_message.user = @user[0]
      respond_to do |format|
        if @private_message.save
          format.html { redirect_to @private_message, notice: 'Message was successfully created.' }
          format.json { render json: @private_message, status: :created, location: @private_message }
        else
          format.html { render action: "new" }
          format.json { render json: @private_message.errors, status: :unprocessable_entity}
        end
      end
    else
      render json: {code:'002', usuario:@user}
    end

  end

  # PUT /private_messages/1
  # PUT /private_messages/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @private_message = PrivateMessage.find(params[:id])

    respond_to do |format|
      if @private_message.update_attributes(params[:private_message])
        format.html { redirect_to @private_message, notice: 'Private message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @private_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_messages/1
  # DELETE /private_messages/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @private_message = PrivateMessage.find(params[:id])
    @private_message.destroy

    respond_to do |format|
      format.html { redirect_to private_messages_url }
      format.json { head :no_content }
    end
  end
end
