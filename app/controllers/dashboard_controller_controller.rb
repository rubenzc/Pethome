class DashboardControllerController < ApplicationController
  def index
  	@homes = [
  		{lat: 40.1720, lng: -3.6567 },
      {lat: 40.4000, lng: -3.7167 },
      {lat: 40.3805031, lng: -3.6336483 },
      {lat: 40.3319506, lng: -3.7686545 }
  	]
  end
end
