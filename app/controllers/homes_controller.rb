class HomesController < ApplicationController
	
	def new
  	@home = Home.new
  end
	
	def create
    @home = Home.new home_params
    
    if @home.save
      redirect_to @home
    else
      flash.now[:alert] = "Bad parameters"
      render 'new'
    end
  end

  def index
    @homes = Home.all
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
      render 'edit'
    end

  end

  private

  def home_params
    params.require(:home).permit(:address, :postcode)
  end

end
