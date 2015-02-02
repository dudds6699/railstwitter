class HomeController < ApplicationController
  
  #loads the main page
  def index
      @tweet = Tweet.count()
      @last = Tweet.last
  end
  
  #updates the tweet count when the node program is running
  def update
    render :json => Tweet.count()
  end
  
  def view
      @tweets = pager(1)
      @startPage = 2
  end
  
  #loads more tweets for viewing
  def loadPages
      
      if params[:page].blank?
          p = 1
      else
          p = Integer(params[:page])
      end
      
      @tweets = pager(p)
      render partial: 'tweet', formats: :html, :locals => {:tweets => @tweets}
      
  end
  
  def lastTweet
      render :json => Tweet.last
  end
  
  #page Calculation very weird
  private
    def pager(pageNum)
        tweetPPCount = 100
        totalTweets = Tweet.count()
      
    if pageNum > 1
        start = (totalTweets - (pageNum - 1)) * tweetPPCount
        return Tweet.where('id >= ? and id <= ?', start , start + tweetPPCount)
    else
        return Tweet.take(tweetPPCount)
    end
      
  end
  
end

