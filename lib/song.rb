class Song 
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def self.all
    @@all
  end
  
   def initialize(name, artist = nil, genre = nil)
     @name = name

     if artist
       self.artist = artist
     end
     
     if genre
       self.genre = genre
     end
  end
  
    def save 
    @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    artist.songs << self
    @artist = artist
    artist.add_song(self)
  end
  
  
  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).tap{|s| s.save}
  end
end