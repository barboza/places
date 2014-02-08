class HomeController < ApplicationController
  require 'open-uri'
  def index
    if request.location.city == ""
      @places = Place.all
    else
      @places = Place.near(request.location.city, 300, :order => :distance)
    end
  end

  def image_redirect

    send_file_headers!({:type => 'image/png', :disposition => 'inline'})
    self.status = 200
    self.response_body = open("http://lorempixel.com/#{params[:x]}/#{params[:y]}/")
  end
end
