get "/profile/:id" do |id|
  @user = User.find_by(id: session[:user_id])
  @interest = Interest.where(user_id: session[:user_id])
  erb :profile
end
