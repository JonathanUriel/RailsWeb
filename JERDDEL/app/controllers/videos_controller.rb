class VideosController < ApplicationController

  def index
    @parametro = params[:id]
    @valor = @parametro
    if Integer(@valor) == 1
       @inicio = Video.all.where(tipo: "Inicio").paginate(page: params[:page],per_page:(3))
    elsif Integer(@valor) == 2
      @promocion = Video.all.where(tipo: "Promocion").paginate(page: params[:page],per_page:(3))
    end
  end

  def new
    @parametro = params[:id]
    @valor = @parametro
    if Integer(@valor) == 0
      @value = "Inicio"
    else
      @value = "Promocion"
    end
    @video = Video.new
  end

  def create
    @video = Video.new(videos_param)
    @valor = params[:video][:tipo]
    if @valor == "Inicio"
      @id = 1
    else
      @id = 2
    end
    if @video.save
      redirect_to videos_path(id: @id)
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
    @value = @video.tipo
  end

  def update
    @video = Video.find(params[:id])
    @valor = @video.tipo
    if @valor == "Inicio"
      @id = 1
    else
      @id = 2
    end
    if @video.update(videos_param)
      redirect_to videos_path(id: @id )
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @valor = @video.tipo
    if @valor == "Inicio"
      @id = 1
    else
      @id = 2
    end
    @video.destroy
    redirect_to videos_path(id: @id )
  end

  private
  def videos_param
    params.required(:video).permit(:tipo,:url)
  end

end