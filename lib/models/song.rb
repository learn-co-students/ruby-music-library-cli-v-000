class Song
  extend Concerns::Findable
  # extend Persistable::ClassMethods
  # include Persistable::InstanceMethods
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def artist_name
    self.artist.name
  end

  def genre_name
    self.genre.name
  end

  def self.destroy_all 
    @@all.clear
  end

  def self.all
    @@all
  end

  def artist=(artist)
    # assign that artist to this song
    @artist = artist
    # add_song this song to the artist class
    artist.add_song(self)
  end

  def genre=(genre)
    # assign that genre to this song
    @genre = genre
    #  check for the song in that genre, then give the genre a new song, this song 
    genre.songs << self unless genre.songs.include?(self)
  end


  def self.new_from_filename(file)
    file_array = file.gsub(".mp3", "").split(" - ")
    artist_name = file_array[0]
    song_name = file_array[1]
    genre_name = file_array[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    file_array = file.gsub(".mp3", "").split(" - ")
    artist_name = file_array[0]
    song_name = file_array[1]
    genre_name = file_array[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
end