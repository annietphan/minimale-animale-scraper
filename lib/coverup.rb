class Coverup
  attr_accessor :name, :url, :price
  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


end
