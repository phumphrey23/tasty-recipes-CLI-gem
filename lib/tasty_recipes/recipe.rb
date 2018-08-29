class TastyRecipes::Recipe
  attr_accessor :title, :course, :ingredients, :instructions, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
