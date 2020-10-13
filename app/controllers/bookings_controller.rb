class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking.user = @user
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(booking_params)
    @booking.plant = @plant
    if @booking.save
      redirect_to bookings_path
    else
      render ‘new’
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
