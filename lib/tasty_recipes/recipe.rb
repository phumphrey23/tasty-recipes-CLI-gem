class TastyRecipes::Recipe
  attr_accessor :title, :course, :ingredients, :instructions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_info(info)
    #add scraped ingredients and instructions to recipe hash
    info.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

end
