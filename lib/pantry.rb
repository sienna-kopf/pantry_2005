class Pantry
  attr_reader :stock,
              :enough_ingredients

  def initialize
    @stock = Hash.new(0)
    @enough_ingredients = false
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    stock_items_with_appropriate_amount = []
    @stock.each do |stock_ingredient, stock_amount|
       if @stock[stock_ingredient] >= recipe.ingredients_required[stock_ingredient]
         stock_items_with_appropriate_amount << stock_ingredient
       end
    end

    if stock_items_with_appropriate_amount.nil?
      @enough_ingredients = false
    elsif recipe.ingredients == stock_items_with_appropriate_amount
      @enough_ingredients = true
    else
      @enough_ingredients = false
    end
    @enough_ingredients
  end
end
