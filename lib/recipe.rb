class Recipe
  attr_reader :name,
              :ingredients_required,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients = []
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
    if !(@ingredients.include?(ingredient))
      @ingredients << ingredient
    end
  end

  def total_calories
    @ingredients_required.reduce(0) do |sum_of_cal, (ingredient, amount)|
      amount.times do
        sum_of_cal += ingredient.calories
      end
      sum_of_cal
    end
  end

  def ingredient_names
    @ingredients.map do |ingredient|
      ingredient.name
    end 
  end
end
