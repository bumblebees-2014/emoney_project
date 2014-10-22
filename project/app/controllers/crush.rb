get '/crush/:id' do |id|

@receiver = Interest.where(user_id: id)
@sender = Interest.where(user_id: session[:user_id])

@interest_array = []
@interest_array2 = []

  @receiver.each do |i|
    @interest_array << i.interest
  end

  @sender.each do |j|
    @interest_array2 << j.interest
  end
@intersection = @interest_array & @interest_array2


  if @intersection.size >= 3
    Crush.create(sender_id: session[:user_id], receiver_id: id)
  end
  erb :send_crush
end





