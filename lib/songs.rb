class Song
  extend Concerns::CommonUtil
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap(&:save)
  end

  def self.new_from_filename(fname)
    song_array = fname.split(' - ')
    song_name, song_artist, song_genre = song_array[1], song_array[0], song_array[2].chomp('.mp3')
    
    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(fname)
    self.new_from_filename(fname).tap(&:save)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    Song.all << self
  end

  def self.all
    @@all
  end
end