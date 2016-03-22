class HomesController < ApplicationController
	

 # GET /homes/new
  def new
  	@home = Home.new
  end
	
  # POST /homes
	def create
    @home = Home.new (home_params)
    if @home.save
      redirect_to @home
    else
      flash.now[:alert] = "Bad parameters"
      render 'new'
    end
  end

# GET /homes
  def index
    if params[:search].present?
      @homes = Home.near(params[:search])
    else
      @homes = Home.all
    end
  end

# GET /homes/1
  def show
    @home = Home.find(params[:id]) 
  end

# GET /homes/1/edit
  def edit
    @home = Home.find(params[:id]) 
  end

# PATCH/PUT /homes/1
  def update
    @home = Home.find(params[:id])
    if @home.update_attributes(home_params)
      redirect_to @home
    else
      render 'edit'
    end
  end

# DELETE /homes/1
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
