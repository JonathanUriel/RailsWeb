class RelevantsController < ApplicationController
  def index
    @relevant = Relevant.all
  end

  def new
    @relevant = Relevant.new
  end

  def create
    @relevant = Relevant.new(relevant_params)
    if @relevant.save
      redirect_to relevants_path
    else
      render :new
    end
  end

  def edit
    @relevant = Relevant.find(params[:id])
  end

  def update
    @relevant = Relevant.find(params[:id])
    if @relevant.update(relevant_params)
      redirect_to relevants_path
    else
      render :new
    end
  end

  def destroy
    @relevant = Relevant.find(params[:id])
    @relevant.destroy
    redirect_to relevants_path
  end

  private
  def relevant_params
    params.required(:relevant).permit(:tipo,:product_id)
  end
end