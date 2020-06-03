require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_is_initialized_with_no_stock_and_no_stock_check_for_ingredients
    another_pantry = Pantry.new
    expected = Hash.new(0)
    assert_equal expected, another_pantry.stock
    assert_equal 0, another_pantry.stock_check(@ingredient_1)
  end
end
