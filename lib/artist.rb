class Artist

  attr_accessor :name

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << Song.new(name)
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(artist)
    artist = Artist.new(name)
    artist.save
    artist
  end

end
