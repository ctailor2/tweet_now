get '/' do
  erb :index
end

post '/tweet' do
  # Twitter.update(params[:tweet])
  sleep(2)
  params[:tweet]
  # redirect to ("/")
end