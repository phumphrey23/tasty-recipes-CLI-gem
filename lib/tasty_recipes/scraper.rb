class TastyRecipes::Scraper
  #get url from user search converter
  def self.scrape_recipe(url)
     recipe_posts = Nokogiri::HTML(open(url)).css(".feed-item")

     recipe_posts.each do |item|
       recipe = TastyRecipes::Recipe.new
       recipe.title = item.css("h6").text
       recipe.url = item.attributes["href"].value
     end

     #if recipe url empty - destroy/clear
     #TastyRecipes::Recipe.all.reject!{|item| item.title == "{{{ name }}}"}
     TastyRecipes::Recipe.all

  end

  def self.scrape_recipe_info(recipe)
    #binding.pry
    recipe_page = Nokogiri::HTML(open(recipe.url))
    recipe.ingredients = recipe_page.search(".ingredients__section li").map{ |li| li.text.gsub(/\s+/," ")}
    recipe.instructions = recipe_page.search(".prep-steps li").map{ |li| li.text.gsub(/\s+/," ")}
  end

end

#somestuff = Scraper.new
#somestuff.scrape_recipe_info("https://tasty.co/recipe/easy-omelette-cups")
