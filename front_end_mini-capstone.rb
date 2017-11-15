require "Unirest"
require "pp"
response = Unirest.get("http://localhost:3000/vape_url")
products = response.body
pp products