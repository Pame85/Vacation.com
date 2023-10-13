class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @listings = Listing.all

    # Apply filters if parameters are present
    if params[:location].present?
      @listings = @listings.where('location ILIKE ?', "%#{params[:location]}%")
    end

    if params[:availability].present?
      @listings = @listings.where(available: true)
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, notice: 'Listing was successfully deleted.'
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :property_type, :price, :location, :description, :rooms, :capacity, :available, :average_rating)
  end
end
