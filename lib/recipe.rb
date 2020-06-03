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
end
