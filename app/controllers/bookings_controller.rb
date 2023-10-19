class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params.merge(listing_id: @listing.id))
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :duration, :total_price)
  end
end
