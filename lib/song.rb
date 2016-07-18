class Song

  attr_accessor :name, :artist

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
    self.class.all << self # saves each instance of the class into the all class array. Note: This syntax self.class.all is  more reusable
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(song)
    song = Song.new(name)
    song.save
    song
  end

  # adds the song to the artist\'s songs
  def artist=(artist)
    @artist = artist
    artist.songs << self
  end

end
