class GalleriesController < ApplicationController

  def index
    @parametro = params[:id]
    @valor = @parametro
    if Integer(@valor) == 0
      @gallery = Product.all
    elsif Integer(@valor) == 1
      @inicio = Gallery.all
    elsif Integer(@valor) == 2
      @promocion = Gallery.all
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
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(galleries_params)
    @valor = params[:gallery][:tipo]
    if @valor == "Inicio"
      @id = 1
    else
      @id = 2
    end
    if @gallery.save
      redirect_to galleries_path(id: @id)
    else
      render :new
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @value = @gallery.tipo
  end

  def update
    @gallery = Gallery.find(params[:id])
    @valor = @gallery.tipo
    if @valor == "Inicio"
      @id = 1
    else
      @id = 2
    end
    if @gallery.update(galleries_params)
      redirect_to galleries_path(id: @id )
    else
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @valor = @gallery.tipo
    if @valor == "Inicio"
      @id = 1
    else
      @id = 2
    end
    @gallery.destroy
    redirect_to galleries_path(id: @id )
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def galleries_params
    params.required(:gallery).permit(:tipo,:promocion,:product_id)
  end


end
