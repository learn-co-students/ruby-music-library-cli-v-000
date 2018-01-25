class Song 
  extend Concerns::Findable
  attr_accessor :name, :genre 
  attr_reader :artist
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name) 
    song.save
    song
  end

  def self.new_from_filename (filename)  
    parts = filename.split(" - ")
    artist_n = parts[0]
    song_n = parts[1]
    genre_n = parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_n)
    genre = Genre.find_or_create_by_name(genre_n)
    new(song_n, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |song| song.save }
  end


end
