# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin_role = Role.create(role: "admin")
customer_role = Role.create(role: "customer")

user1 = User.create(first_name: "Aman", last_name: "Pathan", email: "amanpathan@gmail.com", phone_number: "9812345678")
user2 = User.create(first_name: "Sahil", last_name: "Patil", email: "sahilpatil@gmail.com", phone_number: "1234567890")
user3 = User.create(first_name: 'Alice', last_name: 'Johnsom', email: 'alice.johnson@gmail.com', phone_number: '8765456789')

UserRole.create(user: user1, role: admin_role)
UserRole.create(user: user2, role: customer_role)
UserRole.create(user: user3, role: customer_role)

restaurant1 = Restaurant.create(restaurant_name: 'King Restaurant', address: 'Baner,Pune', contact: '1231231231')
restaurant2 = Restaurant.create(restaurant_name: 'Queen Restaurant', address: 'Akurdi,Pune', contact: '2323232323')

UserRestaurant.create(user: user1, restaurant: restaurant1)
UserRestaurant.create(user: user1, restaurant: restaurant2)

table1 = RestaurantTable.create(restaurant_id: restaurant1.id, qr_code_url: 'qrcode1')
table2 = RestaurantTable.create(restaurant_id: restaurant1.id, qr_code_url: 'qrcode2')
table3 = RestaurantTable.create(restaurant_id: restaurant1.id, qr_code_url: 'qrcode3')

table4 = RestaurantTable.create(restaurant_id: restaurant2.id, qr_code_url: 'qrcode1')
table5 = RestaurantTable.create(restaurant_id: restaurant2.id, qr_code_url: 'qrcode2')
table6 = RestaurantTable.create(restaurant_id: restaurant2.id, qr_code_url: 'qrcode3')

menu_item1 = MenuItem.create(restaurant_id: restaurant1.id, item_name: 'Burger', description: 'Extra cheese burger', price: 200, image_url: 'https://example.com/burger.jpg')
menu_item2 = MenuItem.create(restaurant_id: restaurant1.id, item_name: 'Fries', description: 'Crispy fries', price: 250, image_url: 'https://example.com/fries.jpg')

menu_item3 = MenuItem.create(restaurant_id: restaurant2.id, item_name: 'Biryani', description: 'Spicy dum biryani', price: 250, image_url: 'https://example.com/biryani.jpg')
menu_item4 = MenuItem.create(restaurant_id: restaurant2.id, item_name: 'Paneer', description: 'Paneer Masala', price: 150, image_url: 'https://example.com/paneer.jpg')

order1 = Order.create(restaurant_table_id: table1.id, user_id: user2.id, order_amount: 0.0, order_status: 'completed')
order2 = Order.create(restaurant_table_id: table4.id, user_id: user3.id, order_amount: 0.0, order_status: 'pending')

OrderCart.create(order_id: order1.id, menu_item_id: menu_item1.id, quantity: 1, total_amount: 0.0)
OrderCart.create(order_id: order1.id, menu_item_id: menu_item2.id, quantity: 2, total_amount: 0.0)

OrderCart.create(order_id: order2.id, menu_item_id: menu_item3.id, quantity: 1, total_amount: 0.0)

Review.create(menu_item_id: menu_item1.id, rating: 4.5, comment: 'Excellent burger!', user_id: user2.id)
Review.create(menu_item_id: menu_item2.id, rating: 4.0, comment: 'great experience!', user_id: user3.id)
