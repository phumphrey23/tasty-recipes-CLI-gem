require 'nokogiri'
require 'open-uri'
require relative './recipe.rb'

class Scraper
  #get url from user search converter
  def scrape_recipe_titles(url)
     recipe_post = Nokogiri::HTML(open(url)).css("feed.item")
     recipes = []
     recipe_post.each do |post|
       recipe = Recipe.new
       recipe.title = post.css("h6").text
       recipes << {recipe: recipe.title}
     end
     recipes
  end

  def scrape_recipe_info(recipe_url)
    Nokogiri::HTML(open(recipe_url))
  end

end

#CLASSES
#feed-item
#ingredients-prep --> ingredients, prep
