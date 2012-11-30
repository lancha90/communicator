class FaberGiraldosController < ApplicationController
  # GET /faber_giraldos
  # GET /faber_giraldos.json
  def index
    @faber_giraldos = FaberGiraldo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faber_giraldos }
    end
  end

  # GET /faber_giraldos/1
  # GET /faber_giraldos/1.json
  def show
    @faber_giraldo = FaberGiraldo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faber_giraldo }
    end
  end

  # GET /faber_giraldos/new
  # GET /faber_giraldos/new.json
  def new
    @faber_giraldo = FaberGiraldo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faber_giraldo }
    end
  end

  # GET /faber_giraldos/1/edit
  def edit
    @faber_giraldo = FaberGiraldo.find(params[:id])
  end

  # POST /faber_giraldos
  # POST /faber_giraldos.json
  def create
    @faber_giraldo = FaberGiraldo.new(params[:faber_giraldo])

    respond_to do |format|
      if @faber_giraldo.save
        format.html { redirect_to @faber_giraldo, notice: 'Faber giraldo was successfully created.' }
        format.json { render json: @faber_giraldo, status: :created, location: @faber_giraldo }
      else
        format.html { render action: "new" }
        format.json { render json: @faber_giraldo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faber_giraldos/1
  # PUT /faber_giraldos/1.json
  def update
    @faber_giraldo = FaberGiraldo.find(params[:id])

    respond_to do |format|
      if @faber_giraldo.update_attributes(params[:faber_giraldo])
        format.html { redirect_to @faber_giraldo, notice: 'Faber giraldo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faber_giraldo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faber_giraldos/1
  # DELETE /faber_giraldos/1.json
  def destroy
    @faber_giraldo = FaberGiraldo.find(params[:id])
    @faber_giraldo.destroy

    respond_to do |format|
      format.html { redirect_to faber_giraldos_url }
      format.json { head :no_content }
    end
  end
end
