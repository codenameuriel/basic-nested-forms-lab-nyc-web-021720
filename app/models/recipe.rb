class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
end

# Instructions
# Build a recipe form that accepts two ingredients! It should automatically create the new Ingredient objects
# Ingredient has a name and quantity (String values)

# accepts_nested_attributes_for macro is creating implicitly
def ingredients_attributes=(ingredients_hash)
  ingredients_hash.each do |i|
    ingredient = Ingredient.find_or_create_by(name: i[:name], quantity: i[:quantity])
    self.ingredients << ingredient
  end
end
# ***can not override the implicitly created method by the accepts_nested_attributes_for macro
# ***if trying to avoid duplicate entries, cannot include macro, and have to explicitly define method (and use #update on the found/created object)

# "recipe"=>{
#   "title"=>"Chicken Terkiyaki", 
#   "ingredients_attributes"=>{
#     "0"=>{
#       "name"=>"Chicken", 
#       "quantity"=>"1 lb"
#       }, 
#       "1"=>{
#         "name"=>"Teriyaki Sauce", 
#         "quantity"=>"2 cups"
#         }
#         }
#       }