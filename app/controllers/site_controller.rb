class SiteController < ApplicationController
  
  def index
		if params[:search]
			@homes = Home.search(params[:search])
		else
			@homes = Home.all
		end
	end

	def search
    params[:distance] ||= 20
    @homes = Home.near params[:search], params[:distance]
    render :map
  end

  def map
  	@homes = Home.all
  end

end