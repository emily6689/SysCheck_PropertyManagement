class BuildingsController < ApplicationController
  def index
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.create(building_params)
    if @building.save
      flash[:notice] = "You've successfully submitted new building information!"
      redirect_to new_building_path
    else
      flash[:notice] = "Please enter all the appropriate information."
      render :new
    end
  end

  protected

  def building_params
    params.require(:building).permit(:name, :address, :city, :state, :postalcode, :description)
  end

end
