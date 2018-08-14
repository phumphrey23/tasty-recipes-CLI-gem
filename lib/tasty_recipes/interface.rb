#encapsulate logic of how the user will interact with program
require_relative "../lib/tasty_recipes.rb"
require_relative "../lib/interface.rb"


class Interface

  def call
    #welcome message
    #user input of ingredients (scrape https://tasty.co/search?q=some+ingredient)
    #puts recipe titles that contain input ingredients
    #user input of recipe to try (scrape https://tasty.co/recipe/title-of-recipe for ingredients & instructions)
    #puts all ingredients and instructions for selected recipe


      #ELSE
    #user input of ingredients not found
    #error with prompt to enter less ingredients
      #ELSE
    #user inputs 1 ingredient and not found or user inputs no ingredients
    #puts top 10 most recent recipe titles



  end

  def format_lists
    #collect array items and puts an ordered numbered list
  end

end
