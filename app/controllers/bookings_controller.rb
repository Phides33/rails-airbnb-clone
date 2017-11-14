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
    @rv = Rv.find(1)
    @days = (params[:booking][:check_out_on].to_date - params[:booking][:check_in_on].to_date).to_i
    @booking = Booking.new
    if @days >= @rv.min_stay
      @price = @days * @rv.price_per_night
      @booking = Booking.new(booking_params)
      @booking.price = @price
      @booking.rv = @rv
      @booking.user = current_user
      if @booking.save
        redirect_to bookings_path
      else
        flash.now[:alert] = @booking.errors.full_messages[0]
        render :new
      end
    else
      flash.now[:alert] = "Stay can't be shorter than #{@rv.min_stay} days"
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.review = params[:booking][:review]
    @booking.rating = params[:booking][:rating]
    if @booking.save
      redirect_to booking_path(@booking)
    else
       render :show
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_on, :check_out_on, :rating, :review)
  end

end
