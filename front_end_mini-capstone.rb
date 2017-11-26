require "Unirest"
require "pp"
puts "Welcome to the Weed Store!!"
puts "[1] To see all Products"
puts "[1.1] Search Products by Name"
puts "[2] To see an individual Product"
puts "[3] To Create a Product"
puts "[4] To Amend a Product"
puts "[5] Destroy a Product"
input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  pp products 
elsif input_option == "1.1"
  print "Enter Search Terms: "
  search_terms = gets.chomp
  puts "Here are your matching Products: "
  response = Unirest.get("http://localhost:3000/v1/products?search=#{search_terms}")
  products = repsonse.body
  pp products
elsif input_option == "2"
  print "Which product would you like to see?"
  product_id - gets.chomp
  response = Unirest.get(("http://localhost:3000/v1/products/#{product_id}"))
  product = response.body
  pp  product
elsif input_option == "3"
  response = Unirest.post
end