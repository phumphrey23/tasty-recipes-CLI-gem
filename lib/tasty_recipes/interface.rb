#encapsulate logic of how the user will interact with program

class TastyRecipes::Interface

  def call
    puts "Welcome to Tasty Recipes"
    puts "Enter 1 or more ingredients you have or want to cook with"
    #Welcome message

    ingredients = gets.chomp.downcase
    #user input of ingredients
    if ingredients != nil
      search_by_ingredients(ingredients)
    else
      puts "Please enter a valid search"
    end
    #puts recipe titles that contain input ingredients

    puts "Enter the number of the recipe you would like to try"
    selected_recipe_num = gets.chomp
    #user input of recipe to try (scrape recipe.url for ingredients & instructions)

    recipe_info(selected_recipe_num)
    #puts all ingredients and instructions for selected recipe


      #ELSE
    #user input of ingredients not found
    #error with prompt to enter less ingredients
      #ELSE
    #user inputs 1 ingredient and not found or user inputs no ingredients
    #puts top 10 most recent recipe titles

    #PROBLEMS TO ADDRESS
      #search not found
      #every title past 20 has no usable info
      #recipes within a recipe's title
      #searching non-ingredients (ex. valid searches like breakfast, ravioli, etc will return titles)

  end

  def format_lists
    self.each.with_index(1) do |element, i|
      puts "#{i}. #{element}"
    end
  end

  def search_by_ingredients(ingredients)
  #generate url slug given user input for ingredients
    base = "https://tasty.co/search?q="

    if ingredients != nil
      slug = ingredients.gsub(/\s/,'+')
    else
      puts "Enter a valid search"
      self.call
    end

    url = base + slug

    #scrapes generated url for recipe titles
    scraped_titles = TastyRecipes::Scraper.scrape_recipe(url)
    if scraped_titles == nil
      puts " Search not found. Please enter a valid search"
      self.call #start over
    end
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

    #scrape ingredients and instruction to add to an instance of a recipe
      TastyRecipes::Scraper.scrape_recipe_info(selected_recipe)

      #print the selected recipe
      puts "#{selected_recipe.title}"
      puts "Here are the ingredients you will need:"
      selected_recipe.ingredients.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
      puts "Follow these instructions:"
      selected_recipe.instructions.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
  end

end
