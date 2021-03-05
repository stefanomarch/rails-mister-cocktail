require 'open-uri'

require 'json'

Ingredient.destroy_all
request_uri = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url = request_uri

# Actually fetch the contents of the remote URL as a String.
buffer = open(url).read
# Convert the String response into a plain old Ruby array. It is faster and saves you time compared to the standard Ruby libraries too.
result = JSON.parse(buffer)

# Loop through each of the elements in the 'result' Array & print some of their attributes.
result['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
