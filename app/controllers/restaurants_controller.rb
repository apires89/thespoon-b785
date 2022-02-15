class RestaurantsController < ApplicationController
  before_action :set_restaurant, only:[:show,:edit,:update,:destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    #http://localhost:3000/restaurants/:id --> params[:id]
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    ##find the restaurant
    #update with strong params
    @restaurant.update(restaurant_params)
    #redirect
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    #find the restaurant
    #destroy it
    @restaurant.destroy
    #redirect
    redirect_to restaurants_path
  end


  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


  def restaurant_params
    params.require(:restaurant).permit(:name,:address,:rating,:phone_number)
  end





end
