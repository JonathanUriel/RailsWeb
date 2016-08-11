class InformationsController < ApplicationController
  def index
    @information = Information.all
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to config_index_path
    else
      render :edit
    end
    end

    private

    def information_params
      params.required(:information).permit(:history,:mission,:vision,:objetive,:values)
    end
end