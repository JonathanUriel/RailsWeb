class ConfigController < ApplicationController
  def index
    @information = Information.all
  end
end
