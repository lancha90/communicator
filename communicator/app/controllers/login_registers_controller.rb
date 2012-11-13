class LoginRegistersController < ApplicationController
  # GET /login_registers
  # GET /login_registers.json
  def index
    @login_registers = LoginRegister.all
    respond_to do |format|
      format.html # index.html.erb
      
      format.json { render json: @login_registers }
    end
  end

  # GET /login_registers/1
  # GET /login_registers/1.json
  def show
    @login_register = LoginRegister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @login_register }
    end
  end

  # GET /login_registers/new
  # GET /login_registers/new.json
  def new
    @login_register = LoginRegister.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login_register }
    end
  end

  # GET /login_registers/1/edit
  def edit
    @login_register = LoginRegister.find(params[:id])
  end

  # POST /login_registers
  # POST /login_registers.json
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
  def destroy
    @login_register = LoginRegister.find(params[:id])
    @login_register.destroy

    respond_to do |format|
      format.html { redirect_to login_registers_url }
      format.json { head :no_content }
    end
  end
end
