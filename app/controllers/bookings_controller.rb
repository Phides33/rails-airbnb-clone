class BookingsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    #@rv = Rv.find(params[:rv_id])
    @rv = Rv.find(1)
    @days = (params[:booking][:check_out_on].to_date - params[:booking][:check_in_on].to_date).to_i
    if @days >= @rv.min_stay
      @price = @days * @rv.price_per_night
      @booking = Booking.new(booking_params)
      @booking.price = @price
      @booking.rv = @rv
      @booking.user = current_user
      if @booking.save

        redirect_to bookings_path
      else
        raise
        render :new
      end
    else
      render :new, {alert: "stay must be at least #{@rv.min_stay} long"}
    end


  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_on, :check_out_on)
  end

end
