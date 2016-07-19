class Song

  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @@all << self
    @artist = artist
    @genre = genre
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
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
