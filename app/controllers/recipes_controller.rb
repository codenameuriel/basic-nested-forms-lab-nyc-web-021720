class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save 
      redirect_to @recipe
    else
      render :new 
    end
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end

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
