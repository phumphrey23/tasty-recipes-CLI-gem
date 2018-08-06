class Recipe
  attr_accessor :title, :rating, :course, :ingredients, :instructions

  def initialize(title)
    @title = title
  end

end
