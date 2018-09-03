#encapsulate logic of how the user will interact with program

class TastyRecipes::Interface

  def call
    puts "Please enter a valid search.  You can search by ingredients, meal course, or a name of a specific dish."
    #Welcome message

    input = gets.chomp.downcase
    #user input of ingredients
    search(input)

    #puts recipe titles that contain input ingredients
    if TastyRecipes::Recipe.all == []
      puts "Sorry, we can't find any recipes for #{input}"
      call
    else
      print_titles
    end

    puts "Enter the number of the recipe you would like to try"
    selected_recipe_num = gets.chomp
    #user input of recipe to try (scrape recipe.url for ingredients & instructions)

    recipe_info(selected_recipe_num)
    #puts all ingredients and instructions for selected recipe


    #PROBLEMS TO ADDRESS
      #invalid input (special characters or blank) / RESOLVED
      #search not found
      #every title past 20 has no usable info / RESOLVED
      #recipes within a recipe's title / RESOLVED
      #searching non-ingredients but still valid (ex. valid searches like breakfast, ravioli, etc will return titles) / RESOLVED

  end

  def format_lists
    self.each.with_index(1) do |element, i|
      puts "#{i}. #{element}"
    end
  end

  def search(input)
  #generate url slug given user input for ingredients
    base = "https://tasty.co/search?q="
    #special = ",", "+", "!", ".", "@", "#", "$", "^", "&", "*", "(", ")", "_", "-", "="
    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    if input == nil || input =~ /[#{special.gsub(/./){|char| "\\#{char}"}}]/
      puts "Invalid search"
      call
    else
      slug = input.gsub(/\s/,'+')
    end

    url = base + slug

    #binding.pry
    #scrapes generated url for recipe titles
    TastyRecipes::Scraper.scrape_recipe(url)
  end

  def valid_search(input)
    input != nil
    input.none?(",", "+", "!", ".", "@", "#", "$", "^", "&", "*", "(", ")", "_", "-", "=")
      #puts "Invalid input. Do not iclude special characters in your search and be sure there is a space between each word"
  end

  def recipe_info(selected_recipe_num)
    #generate recipe_url from selected recipe
    if selected_recipe_num.to_i > 0
      selected_recipe = TastyRecipes::Recipe.all[selected_recipe_num.to_i-1]
    else
      puts "Invalid Input"
      call
    end

    #scrape ingredients and instruction to add to an instance of a recipe
      TastyRecipes::Scraper.scrape_recipe_info(selected_recipe)

    #1 print ingredients and instruction (FINISHED)
    #2 if compilation --> scrape_compilation_recipe, get input, get recipe_info (FINISHED)
      if selected_recipe.ingredients != [] && selected_recipe.instructions != []
        print_recipe(selected_recipe)
      else
        TastyRecipes::Recipe.all.clear
        TastyRecipes::Scraper.scrape_recipe(selected_recipe.url)
        puts "Enter the number of the recipe you'd like to try from this compilation"
        print_titles
        puts "Enter the number of the recipe you would like to try"
        selected_recipe_num = gets.chomp
        recipe_info(selected_recipe_num)
      end
  end

  def print_titles
    #collects all recipe titles in an array
    recipe_titles = TastyRecipes::Recipe.all.map { |item| item.title }
    #prints formated list
    recipe_titles.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
  end

  def print_recipe(recipe)
    puts "#{recipe.title}"
    puts "Here are the ingredients you will need:"
    recipe.ingredients.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
    puts "Follow these instructions:"
    recipe.instructions.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
  end

end
