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

  def format_lists
    self.each.with_index(1) do |element, i|
      puts "#{i}. #{element}"
    end
  end

  def search_by_ingredients(ingredients)
  #generate url slug given user input for ingredients
    base = "https://tasty.co/search?q="
    slug = ingredients.gsub(/\s/,'+')
    url = base + slug

    #scrapes generated url for recipe titles
    TastyRecipes::Scraper.scrape_recipe(url)

    #collects all recipe titles and prints in formated list
    recipe_titles = TastyRecipes::Recipe.all.map { |item| item.title}
    
    #recipe_titles.format_lists
    recipe_titles.each.with_index(1) { |element, i| puts "#{i}. #{element}" }

    #binding.pry

  end

  def recipe_info(selected_recipe_num)
    #generate recipe_url from selected recipe
    if selected_recipe_num.to_i > 0
      selected_recipe = TastyRecipes::Recipe.all[selected_recipe_num.to_i-1]
    else
      puts "please enter the number of the recipe you'd like to try"
    end

    #scrape ingredients and instruction to add to a recipe
    TastyRecipes::Recipe.all.each do |recipe|
      recipe.Scraper.scrape_recipe_info(recipe_url)
    end
  end

end
