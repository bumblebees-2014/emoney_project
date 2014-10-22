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
  end
  redirect "/profile/#{session[:user_id]}"
end

delete "/interest/delete" do


end
