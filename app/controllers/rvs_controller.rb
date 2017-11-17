class RvsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @rvs = Rv.all
    @rvs = Rv.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@rvs) do |rv, marker|
      marker.lat rv.latitude
      marker.lng rv.longitude
      # marker.infowindow render_to_string(partial: "/rvs/map_box", locals: { rv: rv })
    end
  end

  def show
    @rv = Rv.find(params[:id])
    
    @hash = Gmaps4rails.build_markers(@rv) do |rv, marker|
      marker.lat rv.latitude
      marker.lng rv.longitude
      # marker.infowindow render_to_string(partial: "/rvs/map_box", locals: { rv: rv })
    end
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

  def edit
    @rv = Rv.find(params[:id])
  end

  def update
    @rv = Rv.find(params[:id])
    @rv.name = params[:rv][:name]
    @rv.localisation = params[:rv][:localisation]
    @rv.kind = params[:rv][:kind]
    @rv.number_of_beds = params[:rv][:number_of_beds]
    @rv.number_of_guests = params[:rv][:number_of_guests]
    @rv.price_per_night = params[:rv][:price_per_night]
    @rv.min_stay = params[:rv][:min_stay]
    @rv.photo = params[:rv][:photo]
    @rv.user = current_user
    if @rv.save
      redirect_to rv_path(@rv)
    else
      render :edit
    end
  end

  def my_rvs
    @my_rvs = current_user.rvs
  end
  def destroy
    @rv = Rv.find(params[:id])
    @rv.destroy
    redirect_to myrvs_path
  end

  private

  def rv_params
    params.require(:rv).permit(:name, :localisation, :kind, :number_of_beds, :number_of_guests, :price_per_night, :min_stay, :photo)
  end
end
