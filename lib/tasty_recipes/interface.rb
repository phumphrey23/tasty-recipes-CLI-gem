#encapsulate logic of how the user will interact with program
require_relative "../lib/tasty_recipes.rb"
require_relative "../lib/interface.rb"


class Interface

  def call
    puts "Welcome to Tasty Recipes"
    puts "Enter 1-3 ingredients you have"
    #Welcome message

    ingredients = gets.chomp.downcase
    #user input of ingredients

    search_by_ingredients(ingredients)
    #puts recipe titles that contain input ingredients

    puts "Enter the number of the recipe you would like to try"
    selected_recipe = gets.chomp
    #user input of recipe to try (scrape https://tasty.co/recipe/title-of-recipe for ingredients & instructions)

    recipe_info(selected_recipe)
    #puts all ingredients and instructions for selected recipe


      #ELSE
    #user input of ingredients not found
    #error with prompt to enter less ingredients
      #ELSE
    #user inputs 1 ingredient and not found or user inputs no ingredients
    #puts top 10 most recent recipe titles



  end

  def format_lists(array)
    array.each.with_index(1) do |element, i|
      puts "#{i}. #{element}"
    end
  end

  def search_by_ingredients(ingredients)
  #generate url slug given user input for ingredients
  #scrapes generated url for titles
    base = "https://tasty.co/search?q="
    slug = ingredients.gsub(/\s/,'+')
    url = base + slug
    recipe_titles = Scraper.scrape_recipe_titles(url)
    recipe_titles.format_lists
  end

  def recipe_info(recipe_chosen)

  end

end
