class AddTweetTextToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweettext, :string
  end
end
