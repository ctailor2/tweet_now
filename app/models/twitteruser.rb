class Twitteruser < ActiveRecord::Base
  has_many :tweets
  
  def fetch_tweets!
    Twitter.user_timeline(self.username).each do |tweet|
      Tweet.create(twitteruser_id: self.id, text: tweet.text)
    end
  end

  def tweets_stale?
    created_times = Twitter.user_timeline(self.username).first(5).map {|tweet| tweet.created_at }
    p created_times
    intervals = []
    n = 0
    while n <= 3
      intervals << created_times[n] - created_times[n+1]
      n += 1
    end
    p intervals
    average = intervals.sum / 5
    p average
    Time.now - self.tweets.last.updated_at >= average
  end
  # Remember to create a migration!
end
