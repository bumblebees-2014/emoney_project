get "/profile/all" do
  @user = User.all

erb :users
end

get "/profile/:id" do |id|
  @user = User.find_by(id: id)
  @interest = Interest.where(user_id: id)
  @crushes_received = Crush.where(receiver_id: id)
  @crushes_sent = Crush.where(sender_id: id)
  erb :profile
end


