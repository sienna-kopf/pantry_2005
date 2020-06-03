class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.each do |recipe|
      @ingredients << recipe.ingredient_names
    end
    @ingredients.flatten.uniq
  end

  def highest_calorie_meal
    total = @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

end
