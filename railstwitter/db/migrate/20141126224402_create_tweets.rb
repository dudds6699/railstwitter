class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :twitterID
      t.string :tweetID
      t.string :username
      t.string :place
      t.point :coords, :srid => 4326

      t.timestamps
    end
  end
end
