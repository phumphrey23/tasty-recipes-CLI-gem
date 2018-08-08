#encapsulate logic of how the user will interact with program
require_relative "../lib/tasty_recipes.rb"
require_relative "../lib/interface.rb"


class Interface

  def call
    #welcome message
    #user input of ingredients (https://tasty.co/search?q=some+ingredient)
    #puts recipe titles that contain input ingredients
    #user input of recipe to try (https://tasty.co/recipe/title-of-recipe)
    #puts all ingredients and instructions

    #user input of ingredients not found
    #error with prompt to enter less ingredients
    #user inputs 1 ingredient and not found or no ingredients
    #puts top 10 most recent recipe titles
    #user input of recipe to try
    #puts all ingredients and instructions
  end

  def list_recipes
    #collect recipe titles and order in a numbered list array
  end

  def list_ingredients
    #format ingredients
  end

  def list_instructions
    #format instructions
  end

end
