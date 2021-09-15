class RestaurantsController < ApplicationController

  def show 
      @restaurant = Restaurant.find(params[:id])
  end

  def new
  	  @category = Category.find(params[:category_id])
      @restaurant = Restaurant.new
  end

  def create
  	  @category = Category.find(params[:category_id])
      @restaurant = @category.restaurants.create(restaurant_params)
      redirect_to category_path(@category)
  end

  def edit 
      @category = Category.find(params[:category_id])
      @restaurant = @category.restaurants.find(params[:id])
  end 

  def update
      @category = Category.find(params[:category_id])
      @restaurant = @category.restaurants.find(params[:id])
      @restaurant.update(restaurant_params)
      redirect_to category_path(@category) 
  end
         
  def destroy
      @category = Category.find(params[:category_id])
      @restaurant = @category.restaurants.find(params[:id])
      @restaurant.destroy
      redirect_to category_path(@category)
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end
end

