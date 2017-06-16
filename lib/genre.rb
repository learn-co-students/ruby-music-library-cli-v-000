class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create
    genre = Genre.new
    @@all << genre
    genre
  end

end
