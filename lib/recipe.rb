class Recipe
  attr_accessor :title, :course, :ingredients, :instructions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  #def add_recipe_info
    #add scraped ingredients and instructions to recipes?
  #end

end
