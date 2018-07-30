class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = " ", genre = nil)
     @name = name
     @artist = artist
     @genre = genre
    #attributes.each {|k, v| self.send(("#{k}="), v)}
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    @@all << self
    self
  end



end
