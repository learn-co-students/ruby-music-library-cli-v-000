class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.new_from_filename(name)
    file = name.split(" - ")
    song_name = file[1]
    artist_name = file[0]
    genre_name = file[2].chomp('.mp3')
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.find_or_create_by_name(song_name)
    song.artist = artist
    song.genre = genre
    @song = song
  end
  
  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    self.new(song)
  end
  
end