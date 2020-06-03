require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_it_is_initialized_with_a_name_and_no_required_ingredients
    another_recipe = Recipe.new("Grilled Cheese")
    assert_equal "Grilled Cheese", another_recipe.name
    expected = Hash.new(0)
    assert_equal expected, another_recipe.ingredients_required
  end

  def test_it_can_add_ingredients
    expected = {
      @ingredient1 => 6,
      @ingredient2 => 8
    }
    assert_equal expected, @recipe1.ingredients_required
    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients 
  end
end
