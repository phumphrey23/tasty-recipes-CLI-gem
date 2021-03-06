class TastyRecipes::Interface

  def start
    puts "Welcome to Tasty Recipes"
    call
  end

  def call
    input = ""
    while input != "exit"

    puts ""
    puts "Please enter a valid search.  You can search by ingredients, meal course, or a name of a specific dish."
    puts "If you would like to leave type the word exit"
    input = gets.chomp.downcase
    search(input)

    if TastyRecipes::Recipe.all == []
      puts "Sorry, we can't find any recipes for #{input}"
      call
    else
      print_titles
    end

    puts "Enter the number of the recipe you would like to try"
    selected_recipe_num = gets.chomp

    recipe_info(selected_recipe_num)
    TastyRecipes::Recipe.all.clear
  end
  end

  def search(input)
    base = "https://tasty.co/search?q="

    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    if input == nil || input =~ /[#{special.gsub(/./){|char| "\\#{char}"}}]/
      puts "Invalid search"
      call
    else
      slug = input.gsub(/\s/,'+')
    end

    url = base + slug

    TastyRecipes::Scraper.scrape_recipe(url)
  end

  def recipe_info(selected_recipe_num)

    if selected_recipe_num.to_i > 0
      selected_recipe = TastyRecipes::Recipe.all[selected_recipe_num.to_i-1]
    else
      puts "Invalid Input"
      TastyRecipes::Recipe.all.clear
      call
    end

      TastyRecipes::Scraper.scrape_recipe_info(selected_recipe)

      if selected_recipe.ingredients != [] && selected_recipe.instructions != []
        print_recipe(selected_recipe)
        TastyRecipes::Recipe.all.clear
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
    recipe_titles = TastyRecipes::Recipe.all.map { |item| item.title }
    recipe_titles.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
    puts ""
  end

  def print_recipe(recipe)
    puts "#{recipe.title}"
    puts ""
    puts "Here are the ingredients you will need:"
    recipe.ingredients.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
    puts""
    puts "Follow these instructions:"
    recipe.instructions.each.with_index(1) { |element, i| puts "#{i}. #{element}" }
  end


end
