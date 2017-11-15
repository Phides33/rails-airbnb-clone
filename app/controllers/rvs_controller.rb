class RvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @rvs = Rv.all
  end
  def show
    @rv = Rv.find(params[:id])
  end

  def new
    @rv = Rv.new
  end

  def create
    @rv = Rv.new(rv_params)
    @rv.user = current_user
    if @rv.save
      redirect_to rv_path(@rv)
    else
      render :new
    end
  end

  def destroy
    @rv = Rv.find(params[:id])
  end

  private

  def rv_params
    params.require(:rv).permit(:name, :localisation, :kind, :number_of_beds, :number_of_guests, :price_per_night, :min_stay)
  end
end
