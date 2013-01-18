class HomeController < ApplicationController
  def index
    if request.location.city == "
      @places = Place.all
    else
      @places = Place.near(request.location.city, 300, :order => :distance)
    end
  end
end
