class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  def new
    logger.info { 'entro en new' }
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create

  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST'
  headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, X-CSRF-Token'

    @user = User.new(params[:user])
    @dependence = Dependence.find(params[:dependence])
    @user.dependence = @dependence

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json {
          logger.info { "[REGISTER - OK] - El usuario se acaba de registrar!" }
          render json: {code: '101'}
        }
      else
        format.html { render action: "new" }
        format.json {
          logger.info { "[REGISTER - ERROR] - El usuario no se pudo registrar!" }
          render json: {code: '102'} }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
