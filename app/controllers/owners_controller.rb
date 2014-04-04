class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

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

  def destroy
    @owner = Owner.find(params[:id])
    @owner.delete
    redirect_to owners_path
  end

  protected

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email)
  end
end
