class Dessert

  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    return true if calories < 200
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  
  attr_accessor :flavor

  def initialize(flavor)
    @flavor = flavor
    name = flavor + " jelly bean"
    super(name, 5)
  end

  def delicious?
    return false if @flavor == "licorice"
    return true
  end
end
