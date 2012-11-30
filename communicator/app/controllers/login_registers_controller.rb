class LoginRegistersController < ApplicationController
  # GET /login_registers
  # GET /login_registers.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @login_registers = LoginRegister.all
    respond_to do |format|
      format.html # index.html.erb
      
      format.json { render json: @login_registers }
    end
  end

  # GET /login_registers/1
  # GET /login_registers/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @login_register = LoginRegister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @login_register }
    end
  end

  # GET /login_registers/new
  # GET /login_registers/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  def new
    @login_register = LoginRegister.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login_register }
    end
  end

  # GET /login_registers/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @login_register = LoginRegister.find(params[:id])
  end

  # POST /login_registers
  # POST /login_registers.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create
    @login_register = LoginRegister.new(params[:login_register])

    respond_to do |format|
      if @login_register.save
        format.html { redirect_to @login_register, notice: 'Login register was successfully created.' }
        format.json { render json: @login_register, status: :created, location: @login_register }
      else
        format.html { render action: "new" }
        format.json { render json: @login_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /login_registers/1
  # PUT /login_registers/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @login_register = LoginRegister.find(params[:id])

    respond_to do |format|
      if @login_register.update_attributes(params[:login_register])
        format.html { redirect_to @login_register, notice: 'Login register was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @login_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_registers/1
  # DELETE /login_registers/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @login_register = LoginRegister.find(params[:id])
    @login_register.destroy

    respond_to do |format|
      format.html { redirect_to login_registers_url }
      format.json { head :no_content }
    end
  end
end
