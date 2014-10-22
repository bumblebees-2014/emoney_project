get '/' do
  erb :index
end

get "/register" do
  erb :register
end

post "/register" do
  #fix for invalid inputs
  user = User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
  session[:user_id] = user.id
  redirect "/confirm"
end

get "/confirm" do
  @user = User.find_by(id: session[:user_id])
  erb :confirm
end

get "/profile/:id" do |id|
  @user = User.find_by(id: id)
  erb :profile
end

get "/signin" do
  erb :signin
end

post "/signin" do
  @user = User.find_by(email: params[:user][:email])
  valid = @user.authenticate(params[:user][:password])
  if valid
    session[:user_id]= @user.id
    redirect '/confirm'
  else
    redirect '/signin'
  end
end

get '/logout' do
  session.clear
  redirect to :'/'
end


