#encapsulate logic of how the user will interact with program

class TastyRecipes::Interface

  def call
    puts "Welcome to Tasty Recipes"
    puts "Enter 1-3 ingredients you have or want to cook with"
    #Welcome message

    ingredients = gets.chomp.downcase
    #user input of ingredients

    search_by_ingredients(ingredients)
    #puts recipe titles that contain input ingredients

    puts "Enter the number of the recipe you would like to try"
    selected_recipe_num = gets.chomp
    #user input of recipe to try (scrape https://tasty.co/recipe/title-of-recipe for ingredients & instructions)

    recipe_info(selected_recipe_num)
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
    base = "https://tasty.co/search?q="
    slug = ingredients.gsub(/\s/,'+')
    url = base + slug

    #scrapes generated url for recipe titles
    recipe_titles = Scraper.scrape_recipe_titles(url)
    @recipes = recipe_titles.format_lists
  end

  def recipe_info(selected_recipe_num)
    #generate recipe_url from selected recipe
    if selected_recipe_num.to_i > 0
      selected_recipe = @recipes[selected_recipe_num.to_i-1]
    else
      puts "please enter the number of the recipe you'd like to try"
    end

    recipe_url = "https://tasty.co/search?q=" + selected_recipe.gsub(/\s/,'-')

    #scrape ingredients and instruction to add to a recipe
    Recipe.all.each do |recipe|
      info = Scraper.scrape_recipe_info(recipe_url)
      recipe.add_recipe_info(info)
    end
  end

end
