class Song
  #accepts a name upon initialization and set that property
  #name property should be readable and writable by object

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

# can be invoked with an optional second argument artist
# assign the artist property if artist is provided (song belongs to artist)
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

# assigns an artist to the song (song belongs to artist)
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # assigns a genre to the song (song belongs to genre)
  # adds the song to the genre's collection of songs (genre has many songs)
  # does not add the song to the genre's collection if it's already exists.
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song =new(name)
    song.save
    song

  end

  def self.find_by_name(name)
    all.detect {|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
