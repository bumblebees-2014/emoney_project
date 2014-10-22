User.create(name: "Edwin", email: "emoney86@gmail.com", password: "password")
User.create(name: "Jenny", email: "jenny86@gmail.com", password: "password")
User.create(name: "Erica", email: "erica86@gmail.com", password: "password")


Crush.create(sender_id: 1, receiver_id: 2)
Crush.create(sender_id: 2, receiver_id: 1)

Interest.create(interest: "golf", user: User.all.sample )
Interest.create(interest: "cooking", user: User.all.sample)
Interest.create(interest: "shopping", user: User.all.sample)



