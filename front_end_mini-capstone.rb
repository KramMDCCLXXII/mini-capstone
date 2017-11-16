require "Unirest"
require "pp"
response = Unirest.get("http://localhost:3000/v1/all_products_url")
products = response.body
pp products