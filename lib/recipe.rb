class Recipe
  attr_accessor :title, :course, :ingredients, :instructions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end
