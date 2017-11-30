require "unirest"
require "pp"
class Frontend
  def initialize
    @jwt = ""
  end
  def show_menu
    while true
      system "clear"
      puts "Choose an option:"
      puts "[1] Show all products"
      puts "  [1.1] Show all products that match search terms"
      puts "  [1.2] Show all products sorted by price"
      
      puts "[2] Create a product"
      puts "[3] Show one product"
      puts "[4] Update a product"
      puts "[5] Delete a product"
      puts "[6] Order product(s)"
      puts "[7] Show ordered product(s)"
      puts
      puts "[signup] Sign up (create a user)"
      puts "[login] Log in (create a jwt)"
      puts "[logout] Log out (destroy the jwt)"
      puts
      puts "[q] Quit"
  end

  input_option = gets.chomp
  if input_option == "1"
    response = Unirest.get("http://localhost:3000/v1/products")
    products = response.body
    pp products

  elsif input_option == "1.1"
    print "Enter search terms: "
    input_search_terms = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products?search=#{input_search_terms}")
    products = response.body
    pp products
  elsif input_option == "1.2"
    response = Unirest.get("http://localhost:3000/v1/products?sort_by_price=true")
    products = response.body
    pp products
  elsif input_option == "2"
    params = {}
    print "New product name: "
    params[:name] = gets.chomp
    print "New product price: "
    params[:price] = gets.chomp
    print "New product image: "
    params[:image] = gets.chomp
    print "New product description: "
    params[:description] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
    product = response.body
    if product["errors"]
      puts "No good!"
      p product["errors"]
    else
      puts "All good!"
      pp product
    end
  elsif input_option == "3"
    print "Enter a product id: "
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body
    pp product
  elsif input_option == "4"
    print "Enter a product id: "
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body
    params = {}
    print "Updated product name (#{product["name"]}): "
    params[:name] = gets.chomp
    print "Updated product price (#{product["price"]}): "
    params[:price] = gets.chomp
    print "Updated product image (#{product["image"]}): "
    params[:image] = gets.chomp
    print "Updated product description (#{product["description"]}): "
    params[:description] = gets.chomp
    params.delete_if { |_key, value| value.empty? }
    response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
    product = response.body
    pp response.body
  elsif input_option == "5"
    print "Enter a product id: "
    product_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
    pp response.body
  elsif input_option == "signup"
    print "Enter name: "
    input_name = gets.chomp
    print "Enter email: "
    input_email = gets.chomp
    print "Enter password: "
    input_password = gets.chomp
    print "Confirm password: "
    input_password_confirmation = gets.chomp
    response = Unirest.post(
      "http://localhost:3000/v1/users",
      parameters: {
        name: input_name,
        email: input_email,
        password: input_password,
        password_confirmation: input_password_confirmation
      }
    )
    pp response.body
  elsif input_option == "login"
    print "Enter email: "
    input_email = gets.chomp
    print "Enter password: "
    input_password = gets.chomp
    response = Unirest.post(
      "http://localhost:3000/user_token",
      parameters: {
        auth: {
          email: input_email,
          password: input_password
        }
      }
    )
    pp response.body
    
    @jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
  elsif input_option == "logout"
    @jwt = ""
    Unirest.clear_default_headers()
    puts "Logged out successfully!"
  elsif input_option == "6"
    params = {}
    puts "Enter the following infomation for the product"
    print "Enter the product ID: "
    params[:product_id] = gets.chomp
    print "Enter the product's quantity: "
    params[:quantity] = gets.chomp.to_i
    response = Unirest.post("http://localhost:3000/v1/orders/", parameters: params)
    product = response.body
    pp product

  elsif input_option == "7"
    response = Unirest.get("http://localhost:3000/v1/orders")
    orders = response.body
    pp orders
  elsif input_option == "q"
    puts "Goodbye!"    
    break
  end
    puts "Press enter to continue"
    gets.chomp
  end
  end
end

frontend = Frontend.new 
frontend.run  