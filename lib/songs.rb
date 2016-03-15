class Song
  extend Concerns::CommonUtil
  extend Concerns::Findable
  #include Concerns

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless !artist
    self.genre = genre unless !genre
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
    self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end

  def self.new_from_filename(fname)
    song_array = fname.split(' - ')
    song = Song.find_or_create_by_name(song_array[1])
    song.artist = Artist.find_or_create_by_name(song_array[0])
    song.genre = Genre.find_or_create_by_name(song_array[2].chomp('.mp3'))
    song
  end

  def self.create_from_filename(fname)
    Song.new_from_filename(fname)
  end

  def self.all
    @@all
  end

  #def self.destroy_all
  #  self.all.clear
  #end
end