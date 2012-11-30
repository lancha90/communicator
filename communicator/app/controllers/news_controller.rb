class NewsController < ApplicationController
  # GET /showNews.json
  # Función encargada de listar las noticias para un perfil especifico
  def showNews

    # @student = param[:student]
    # @teacher = param[:teacher]
    # @admin = param[:admin]

    #@news = News.find(:all,:conditions => {:username =>@username , :password =>@passwd},:limit => 1)
    @student = params[:s]
    @teacher = params[:t]
    @admin = params[:a]

    if(@student == '1')
      @news = News.where("validity <= :date AND student = 1", {:date => params[:date].to_date})
    end
    if(@teacher == '1')
      @news = News.where("validity <= :date AND teacher = 1", {:date => params[:date].to_date})
    end

    if(@admin == '1')
      @news = News.where("validity <= :date AND admin = 1", {:date => params[:date].to_date})
    end

    render json: @news
  end

  # GET /news
  # GET /news.json
  # Función encargado de renderizar en la interfaz de usuario la totalidad de los registros obtenidos
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1
  # GET /news/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario un registro segun su id
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario el formulario de adición de un nuevo registro
  def new
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  # Función encargado de gestionar y renderizar en la interfaz de usuario para editar un registro
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la creación de un nuevo registro
  def create
    @news = News.new(params[:news])
    @dependence = Dependence.find(params[:dependence])
    @news.dependence = @dependence

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la actualización de un registro
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  # Función encargado de gestionar y renderizar en la interfaz de usuario la eliminación de un registro
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end
end
