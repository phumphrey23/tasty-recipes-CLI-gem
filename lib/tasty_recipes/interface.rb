#encapsulate logic of how the user will interact with program
require_relative "../lib/tasty_recipes.rb"
require_relative "../lib/interface.rb"


class Interface

  def call
    #welcome message
    user_input = gets.chomp
    #user input of ingredients
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

  def format_lists(array)
    array.each.with_index(1) do |element, i|
      puts "#{i}. #{element}"
    end
  end

  def search_by_ingredients(user_input)
  #generate url slug given user input for ingredients
  #scrapes generated url for titles
    base = "https://tasty.co/search?q="
    slug = user_input.gsub(/\s/,'+')
    url = base + slug
    Scraper.scrape_recipe_titles(url)
  end

end
