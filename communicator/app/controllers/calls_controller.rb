class CallsController < ApplicationController
  # GET /calls
  # GET /calls.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @calls = Call.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calls }
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @call = Call.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/new
  # GET /calls/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  def new
    @call = Call.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @call = Call.find(params[:id])
  end

  # POST /calls
  # POST /calls.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create
    @call = Call.new(params[:call])

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render json: @call, status: :created, location: @call }
      else
        format.html { render action: "new" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calls/1
  # PUT /calls/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @call = Call.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @call = Call.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end
end
