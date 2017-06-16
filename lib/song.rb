class Song
  attr_accessor :name, :artist, :genre
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
    song = Song.new
    @@all << song
    song
  end

end
