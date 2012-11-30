class EventosController < ApplicationController
  # GET /eventos
  # GET /eventos.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @eventos = Evento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @evento = Evento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/new
  # GET /eventos/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  def new
    @evento = Evento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evento }
    end
  end

  # GET /eventos/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @evento = Evento.find(params[:id])
  end

  # POST /eventos
  # POST /eventos.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create
    @evento = Evento.new(params[:evento])

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render json: @evento, status: :created, location: @evento }
      else
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventos/1
  # PUT /eventos/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end
end
