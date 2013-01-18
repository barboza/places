class HomeController < ApplicationController
  def index
    if request.location.city == ""
      @places = Place.all
    else
      @places = Place.near(request.location.city, 50, :order => :distance)
    end
  end
end
