get '/interest/new' do
  @user = User.find_by(id: session[:user_id])
  @interest = Interest.all
  erb :create_interest
end

post '/interest/new' do

  if params[:interest] == ""
    value = params[:user][:interest]
  else
    value = params[:interest]
  end

  @check = Interest.find_by(interest: value)

  if @check == nil
    @interest = Interest.create(interest: value, user_id: session[:user_id])
    @interest.save
  else
    @interest = Interest.find_or_create_by(interest: value, user_id: session[:user_id])
  end
  redirect "/profile/#{session[:user_id]}"
end

get '/interest/:interest' do |interest|
  @users = []
  @interest = Interest.where(interest: interest)
  @interest.each do |i|
  @users << User.find_by(id: i.user_id)
 end
p "*" * 900
 p @users
 p "*" * 900

  erb :interest
end

get "/interest/delete" do
  @interest = Interest.where(user_id: session[:user_id])
  erb :delete_interest
end

delete "/interest/delete" do
  interest = Interest.find_by(interest: params[:user][:interest])
  interest.destroy
  redirect "/profile/#{session[:user_id]}"
end
