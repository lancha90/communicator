class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb

      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create
    @message = Message.new(params[:message])

    @user = User.find(params[:user])
    @dependence = Dependence.find(params[:dependences])


    if @user != nil

      @message.user = @user
      @message.dependence = @dependence

      respond_to do |format|
        if @message.save
          format.html { redirect_to @message, notice: 'Message was successfully created.' }
          format.json { render json: {code: '201'}}
        else
          format.html { render action: "new" }
          format.json { render json: {code: '203'}}
        end

      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: {code: '202'} }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
