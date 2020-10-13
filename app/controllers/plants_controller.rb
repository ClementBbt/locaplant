class PlantsController < ApplicationController
  before_action :find_plant, only: [ :show, :edit, :update, :destroy ]


  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @user = current_user
    @plant.user = @user
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
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :price_per_day, :category, :tag)
  end

  def find_plant
    @plant = Plant.find(params[:id])
  end

end
