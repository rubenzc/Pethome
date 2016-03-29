class HomesController < ApplicationController

  def search
    @homes = Home.near params[:search], 20
    render :index
  end

  def new
  	@home = Home.new
  end

	def create
    @home = Home.new (home_params)
    if @home.save
      flash.now[:alert] = 'Issue was successfully created'
      redirect_to @home
    else
      flash.now[:alert] = 'Something went wrong, please fill all the fields and try it again'
      render 'new'
    end
  end

  def index
    if params[:search].present?
      @homes = Home.near(params[:search])
    else
      @homes = Home.all
    end
  end

  def show
    @home = Home.find(params[:id]) 
  end

  def edit
    @home = Home.find(params[:id]) 
  end

  def update
    @home = Home.find(params[:id])
    if @home.update_attributes(home_params)
      redirect_to @home
    else
      flash[:alert] = 'Something went wrong, please try it again'
      render 'edit'
      flash[:alert] = ''
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to homes_path
  end

  private
    def home_params
      params.require(:home).permit(:address, :street_number, :city, :state, :postcode, :country, :name, :surname, :phone_number, :email, :type_pet, :max_pets, :title, :description, :avatar)
    end

end
