require_relative "./recipe"

class RecipeRepository
  def all
    result_set = DatabaseConnection.exec_params("SELECT * FROM recipes;", [])
    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record["id"]
      recipe.name = record["name"]
      recipe.average_cooking_time = record["average_cooking_time"]
      recipe.rating = record["rating"]
      recipes << recipe
    end

    recipes
  end

  def find(id)
    result_set = DatabaseConnection.exec_params("SELECT * FROM recipes WHERE id = $1;", [id])
    record = result_set[0]

    recipe = Recipe.new
    recipe.id = record["id"]
    recipe.name = record["name"]
    recipe.average_cooking_time = record["average_cooking_time"]
    recipe.rating = record["rating"]

    recipe
  end
end
