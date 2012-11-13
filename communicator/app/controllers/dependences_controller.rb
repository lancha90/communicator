class DependencesController < ApplicationController
  #GET /dependence_list.json
  def list
    @dependences = Dependence.select('name, id')
    respond_to do |format|
      format.json { render json: @dependences }
    end

  end

  # GET /dependences
  # GET /dependences.json
  def index
    @dependences = Dependence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dependences }
    end
  end

  # GET /dependences/1
  # GET /dependences/1.json
  def show
    @dependence = Dependence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dependence }
    end
  end

  # GET /dependences/new
  # GET /dependences/new.json
  def new
    @dependence = Dependence.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dependence }
    end
  end

  # GET /dependences/1/edit
  def edit
    @dependence = Dependence.find(params[:id])
  end

  # POST /dependences
  # POST /dependences.json
  def create
    @dependence = Dependence.new(params[:dependence])

    respond_to do |format|
      if @dependence.save
        format.html { redirect_to @dependence, notice: 'Dependence was successfully created.' }
        format.json { render json: @dependence, status: :created, location: @dependence }
      else
        format.html { render action: "new" }
        format.json { render json: @dependence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dependences/1
  # PUT /dependences/1.json
  def update
    @dependence = Dependence.find(params[:id])

    respond_to do |format|
      if @dependence.update_attributes(params[:dependence])
        format.html { redirect_to @dependence, notice: 'Dependence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dependence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dependences/1
  # DELETE /dependences/1.json
  def destroy
    @dependence = Dependence.find(params[:id])
    @dependence.destroy

    respond_to do |format|
      format.html { redirect_to dependences_url }
      format.json { head :no_content }
    end
  end
end
