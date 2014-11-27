class HomeController < ApplicationController
  
  def index
      @tweet = Tweet.count()
  end
  
  def update
    render :json => Tweet.count()
  end
  
end

