class Song
  # below we extracting some common functionality of the Findable module into the class
  extend Concerns::Findable # Folder::Filename:  ruby's convention of namespacing modules

  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @@all << self
    # below we are saying if we get an artist passed in as an argument
    # then artist is set to the artist that was passed in and not nil
    if artist
      @artist = artist
      @artist.add_song(self)
    end
    # and artist.add_song(self) will successfully add the song to the artist once it is not set to nil
    if genre
      @genre = genre
      @genre.add_song(self)
    end
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
  def self.create(name)
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

  def find_by_name
  end

  def find_or_create_by_name
  end

end
