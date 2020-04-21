class ExhibitionsController < ApplicationController
  before_action :congestion_delete, only: [:index, :show]

  def index
  	@exhibitions = Exhibition.all
  end

  def show
  	@exhibition = Exhibition.find(params[:id])
  end

  private
  def congestion_delete
    Congestion.where("created_at<?",Time.current.ago(1.hours)).delete_all
  end

  def exhibition_params
    params.require(:exhibition).permit(:name, :place, :start, :end, :image, :description, :summary, :status)
  end
end
