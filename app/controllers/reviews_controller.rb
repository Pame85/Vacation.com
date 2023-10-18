class ReviewsController < ApplicationController
    before_action :authenticate_user! # Ensures user is logged in before accessing reviews
  
    def index
      @reviews = Review.all
    end
  
    def show
      @review = Review.find(params[:id])
    end
  
    def new
      @review = Review.new
    end
  
    def create
      @review = current_user.reviews.new(review_params)
      if @review.save
        redirect_to @review, notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @review = Review.find(params[:id])
    end
  
    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to @review, notice: 'Review was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path, notice: 'Review was successfully deleted.'
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id) # Add other permitted parameters as needed
    end
  end
  