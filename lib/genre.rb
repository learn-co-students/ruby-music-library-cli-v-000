class Genre
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    self.all << genre 
  end

  def save
    self.class.all << self
  end



end