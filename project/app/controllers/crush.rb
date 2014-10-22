get '/crush/:id' do |id|


@receiver = Interest.where(user_id: id)
@sender = Interest.where(id: session[:user_id])

  @interest_array = []
  @receiver.each do |i|
    @interest_array << i.interest
  end

  @interest_array2 = []
  @sender.each do |i|
    @interest_array2 << i.interest
  end



# array1 = receiver.make_array_of_interests
# array2 = sender.make_array_of_interests

@intersection = @interest_array & @interest_array2
# p "*" * 900
puts "#{@intersection.size}"
# p "*" * 900


# def find_matching_interests(set1, set2)
#   @intersection = set1 & set2
#   puts "this is how many in common: #{@intersection.size}"
# end
  erb :send_crush
end





