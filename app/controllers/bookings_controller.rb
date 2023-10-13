class BookingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
    def index
      @bookings = current_user.bookings
    end
  
    def show
      @booking = Booking.find(params[:id])
    end
  
    # def new
    #   @booking = Booking.new
    #   @booking.listing_id = params[:listing_id] if params[:listing_id].present?
    # end
  
    def create
      @listing = Listing.find_by(id:params[:booking][:listing_id])

      @booking = current_user.bookings.new(booking_params)
      @booking.listing_id = @listing.id

      if available_date?(@booking.check_in, @booking.check_out, @listing)

      #   @booking.user = current_user
      if @booking.save
        redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
      else
        render :new
      end
    end
  
  
    def update
      if @booking.update(booking_params)
        redirect_to @booking, notice: 'Booking was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully deleted.'
    end
  
    private
  
    def set_booking
      @booking = Booking.find(params[:id])
    end
  
    def booking_params
      params.require(:booking).permit(:check_in, :check_out, :listing_id, :confirmed, :duration, :total_price)
    end
  end
end