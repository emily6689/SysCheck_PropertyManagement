class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)
    if @owner.save
      flash[:notice] = "You've successfully recorded an owner!"
      redirect_to new_owner_path
    else
      flash[:notice] = "Please fill in the required information."
      render 'new'
    end
  end

  protected

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email)
  end
end
