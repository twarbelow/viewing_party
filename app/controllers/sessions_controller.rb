class SessionsController < ApplicationController

  def create
    client_id = ENV["GOOGLE_CLIENT_ID"]
    client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    code = params[:code]
    #response = Faraday.post
    binding.pry
  end
end
