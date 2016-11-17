class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user


  private

    def authenticate_user
      client_id = ENV['FOURSQUARE_CLIENT_ID']
      redirect_url = CGI.escape("http://localhost:3000/auth")
      # binding.pry
      foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_url}"
      redirect_to foursquare_url unless logged_in?
    end

    def logged_in?
      !!session[:token]
    end

end
