class DevicesController < ApplicationController
    before_action :set_device, only: %i[ show edit update destroy ]
    before_action :authenticate_user!
  
    # GET /devices or /devices.json
    def index
      @devices = Device.all
      @restaurants = Restaurant.all
      @device = Device.new
    end
  
    # GET /devices/1 or /devices/1.json
    def show
      @device = Device.find(params[:id])
    end
  
    # GET /devices/new
    def new
      @device = Device.new
    end
  
    # GET /devices/1/edit
    def edit
      @restaurants = Restaurant.all
    end
  
    # POST /devices or /devices.json
    def create
      @device = Device.new(device_params)
  
      respond_to do |format|
        if @device.save
          format.html { redirect_to devices_path, notice: "El dispositivo se creó correctamente." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /devices/1 or /devices/1.json
    def update
      respond_to do |format|
        if @device.update(device_params)
          format.html { redirect_to devices_path, notice: "El dispositivo se actualizó correctamente." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /devices/1 or /devices/1.json
    def destroy
      @device.destroy
  
      respond_to do |format|
        format.html { redirect_to devices_path, notice: "El dispositivo se eliminó correctamente" }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_device
        @device = Device.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def device_params
        params.require(:device).permit(:name, :status_dev, :restaurant_id)
      end
end
  