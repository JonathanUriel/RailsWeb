class WelcomeController < ApplicationController

  def index
    @welcome = Product.all
    @gallery = Gallery.all.where(tipo: "Inicio")
    @information = Information.all
    @relevant = Relevant.all
    @video = Video.all.where(tipo: "Inicio")
  end

  def show
    @welcome = Product.find(params[:id])
  end

end
