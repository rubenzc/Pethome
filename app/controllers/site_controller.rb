class SiteController < ApplicationController
	
	def index
		if params[:search]
			@homes = Home.search(params[:search])
		else
			@homes = Home.all
		end
	end

	def search
    @homes = Home.near params[:search], 20
    render :map
  end

  def map
  	@homes = Home.all
  end

end