class ExhibitionsController < ApplicationController
  def index
  	@exhibitions = Exhibition.all
  end

  def show
  	@exhibition = Exhibition.find(params[:id])
  end

  private
  def exhibition_params
    params.require(:exhibition).permit(:name, :place, :start, :end, :image, :status)
  end
end
