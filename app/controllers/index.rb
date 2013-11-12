get '/' do
  erb :home
end

get '/:username' do
#display 10 most recent tweets
  @username = params[:username]
  @user = Twitteruser.find_by_username(@username)
  if !@user.nil?
    if @user.tweets_stale?
      @user.tweets.clear
      @user.fetch_tweets!
    end
  else
    @user = Twitteruser.create(username: @username)
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  
  erb :index, :layout => false
end
