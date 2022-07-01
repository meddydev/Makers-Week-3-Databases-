require_relative "lib/database_connection"
require_relative "lib/recipe_repository"

DatabaseConnection.connect("recipes_directory")

recipe_repository = RecipeRepository.new
recipes = recipe_repository.all

recipes.each do |recipe|
  puts "#{recipe.id} - #{recipe.name}, rated #{recipe.rating}/5: takes #{recipe.average_cooking_time} minutes to prepare."
end
