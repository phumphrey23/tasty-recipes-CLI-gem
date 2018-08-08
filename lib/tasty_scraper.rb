require 'nokogiri'
require 'open-uri'

class Scraper

  def access_site
     Nokogiri::HTML(open("https://tasty.co/"))
  end

  def get_recipe_info

  end

  def create_recipe

  end

end

#
