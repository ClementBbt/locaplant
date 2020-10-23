class PlantsController < ApplicationController
  before_action :find_plant, only: [ :show, :edit, :update, :destroy ]


  def index
    if params[:query].present?
      @users = User.near("#{params[:query]}", 2)
      @search = @users.map do |user|
        user.plants
      end
      @plants = @search.flatten
      @markers = @plants.map do |plant|
        {
          lat: plant.user.latitude,
          lng: plant.user.longitude,
          image_url: helpers.asset_url('marker_locaplant.png'),
          infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
        }
      end
    else
      @plants = Plant.all
      @markers = @plants.map do |plant|
        {
          lat: plant.user.latitude,
          lng: plant.user.longitude,
          image_url: helpers.asset_url('marker_locaplant.png'),
          infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
        }
      end
    end
  end

  def show
    @booking = Booking.new
    @marker = [{lat: @plant.user.latitude, lng: @plant.user.longitude, image_url: helpers.asset_url('marker_locaplant.png')}]
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render ‘new’
    end
  end

  def edit
  end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :price_per_day, :category, :tag, :photo)
  end

  def find_plant
    @plant = Plant.find(params[:id])
  end

end
