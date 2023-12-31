class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[ show edit update destroy ]
    before_action :authenticate_user!
  
    # GET /restaurants or /restaurants.json
    def index
      @restaurants = Restaurant.all
      @restaurant = Restaurant.new
    end
  
    # GET /restaurants/1 or /restaurants/1.json
    def show
      @restaurant = Restaurant.find(params[:id])
    end
  
    # GET /restaurants/new
    def new
      @restaurant = Restaurant.new
    end
  
    # GET /restaurants/1/edit
    def edit
      @restaurant = Restaurant.find(params[:id])
    end
  
    # POST /restaurants or /restaurants.json
    def create
      @restaurant = Restaurant.new(restaurant_params)
  
      respond_to do |format|
        if @restaurant.save
          format.html { redirect_to restaurants_path, notice: "El restaurante se creó correctamente." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /restaurants/1 or /restaurants/1.json
    def update
      respond_to do |format|
        if @restaurant.update(restaurant_params)
          format.html { redirect_to restaurants_path, notice: "El restaurante se actualizó correctamente." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /restaurants/1 or /restaurants/1.json
    def destroy
      @restaurant.destroy
  
      respond_to do |format|
        format.html { redirect_to restaurant_url, notice: "El restaurante se eliminó correctamente." }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def restaurant_params
        params.require(:restaurant).permit(:name, :status_rest)
      end
  end
  