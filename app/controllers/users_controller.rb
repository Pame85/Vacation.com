class UsersController < ApplicationController
    def show
      user_id = params[:id]
      # Use user_id to find and display user details
    end
  
    def create
      user_params = params.require(:user).permit(:name, :email)
      # Use user_params to create a new user
    end
  end
  