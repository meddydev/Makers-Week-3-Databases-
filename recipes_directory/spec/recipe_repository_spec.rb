require "recipe_repository"

describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read("spec/seeds_recipes.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "recipes_directory_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end

  it "returns all recipes" do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 3

    expect(recipes[0].id).to eq "1"
    expect(recipes[0].name).to eq "Feta Pasta"
    expect(recipes[0].average_cooking_time).to eq "45"

    expect(recipes[2].id).to eq "3"
    expect(recipes[2].average_cooking_time).to eq "20"
    expect(recipes[2].rating).to eq "5"
  end

  it "returns specific recipes given an id" do
    repo = RecipeRepository.new

    recipe0 = repo.find(1)
    recipe1 = repo.find(2)

    expect(recipe0.id).to eq "1"
    expect(recipe0.name).to eq "Feta Pasta"
    expect(recipe0.rating).to eq "4"

    expect(recipe1.id).to eq "2"
    expect(recipe1.name).to eq "Stuffed Peppers"
    expect(recipe1.rating).to eq "3"
  end
end
