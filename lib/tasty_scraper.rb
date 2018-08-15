require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative './recipe.rb'

class Scraper
  #get url from user search converter
  def scrape_recipe_titles(url)
     recipe_posts = Nokogiri::HTML(open(url)).css(".feed-item")
     recipes = []
     recipe_posts.each do |item|
       recipe = Recipe.new
       recipe.title = item.css("h6").text
       recipes << {title: recipe.title}
     end
     puts recipes
  end

  def scrape_recipe_info(recipe_url)
    recipe_page = Nokogiri::HTML(open(recipe_url))
    recipe = {}
    recipe[:ingredients] = recipe_page.css(".xs-mb1").css(".xs-mt0").text.gsub(/\s+/," ")
    recipe[:instructions] = recipe_page.css(".prep-steps").children.css(".xs-mb2").text.gsub(/\s+/," ")
    #need to edit to seperate each li with comma
    #iterate, push to array, join elements, seperate with comma
    puts recipe
    #binding.pry
  end

end

somestuff = Scraper.new
somestuff.scrape_recipe_info("https://tasty.co/recipe/easy-omelette-cups")

#CLASSES
#feed-item
#ingredients-prep --> ingredients__section, prep-steps
