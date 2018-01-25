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

#splits up filename to be able to add and other class connections


  def self.new_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    song_name = part[1]
    genre_name = part[2].gsub(".mp3", "")

    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

end
