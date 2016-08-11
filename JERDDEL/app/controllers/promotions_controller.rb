class PromotionsController < ApplicationController

  def index
    @gallery = Gallery.all.where(tipo: "Promocion")
    @video = Video.all.where(tipo: "Promocion")
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
end