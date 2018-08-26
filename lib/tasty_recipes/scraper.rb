class TastyRecipes::Scraper
  #get url from user search converter
  def self.scrape_recipe_titles(url)
     recipe_posts = Nokogiri::HTML(open(url)).css(".feed-item")
     recipes = []
     recipe_posts.each do |item|
       recipe = Recipe.new
       recipe.title = item.css("h6").text
       recipes << {title: recipe.title}
     end
     puts recipes
  end

  def self.scrape_recipe_info(recipe_url)
    recipe_page = Nokogiri::HTML(open(recipe_url))
    recipe = {}
    recipe[:ingredients] = recipe_page.search(".ingredients__section li").map{ |li| li.text.gsub(/\s+/," ")}
    recipe[:instructions] = recipe_page.search(".prep-steps li").map{ |li| li.text.gsub(/\s+/," ")}
    puts recipe
    #binding.pry
  end

end

#somestuff = Scraper.new
#somestuff.scrape_recipe_info("https://tasty.co/recipe/easy-omelette-cups")
