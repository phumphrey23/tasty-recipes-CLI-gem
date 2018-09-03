class TastyRecipes::Scraper
  #get url from user search converter
  def self.scrape_recipe(url)
    if url.include?("compilation")
    recipe_posts = Nokogiri::HTML(open(url)).css(".compilation-recipes__list").css(".feed-item")
   else
     recipe_posts = Nokogiri::HTML(open(url)).css(".feed-item")
   end


     recipe_posts.each do |item|
       recipe = TastyRecipes::Recipe.new
       recipe.title = item.css("h6").text
       recipe.url = item.attributes["href"].value
     end

     TastyRecipes::Recipe.all.reject!{|item| item.title.include?("{{{ name }}}")}
     TastyRecipes::Recipe.all
  end

  def self.scrape_recipe_info(recipe)
    recipe_page = Nokogiri::HTML(open(recipe.url))
    recipe.ingredients = recipe_page.search(".ingredients__section li").map{ |li| li.text.gsub(/\s+/," ")}
    recipe.instructions = recipe_page.search(".prep-steps li").map{ |li| li.text.gsub(/\s+/," ")}
  end

end
