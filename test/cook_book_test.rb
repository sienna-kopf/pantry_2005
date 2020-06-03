require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2 = Recipe.new("Cheese Burger")

    @cookbook = CookBook.new

    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_is_initialized_with_no_recipes
    another_cookbook = CookBook.new
    assert_equal [], another_cookbook.recipes
  end

  def test_it_can_add_recipes
    assert_equal [@recipe1, @recipe2],  @cookbook.recipes
  end
end
