require "Unirest"
require "pp"
while true
  system "clear"
  puts "Welcome to the Weed Store!!"
  puts "[1] To see all Products"
  puts "[1.1] Search Products by Name"
  puts "[2] To see an individual Product"
  puts "[3] To Create a Product"
  puts "[4] To Amend a Product"
  puts "[5] Destroy a Product"
  puts "[6] Find a Supplier"
  puts
  puts "[signup] Signup (create a user)"
  puts "[login] Login to the app"
  puts "[q] Quit"
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
elsif input_option == "signup"
  params = {}
  print "Name: "
  params[:name] = gets.chomp
  print "Email: "
  params[:email] = gets.chomp
  print "Password: "
  params[:password] = gets.chomp
  print "Password confirmation: "
  params[:password_confirmation] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  pp response.body
elsif input_option == "login"
  puts "Login in to the app"
  params{}
  print "Email: "
  params[:email] = gets.chomp
  print "Password: "
  params[:password] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/user_token", parameters: auth: {email: params[:email], password: params[:password]})


    
  elsif input_option == "q"
    puts "Goodbye!"
    break
  end
  puts 
  puts "Press enter to continue"
  gets.chomp
end
