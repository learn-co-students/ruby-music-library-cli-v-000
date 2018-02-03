class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.create(name, artist=nil, genre=nil)
    new(name, artist, genre).tap{|o| o.save}
  end
  
  def self.new_from_filename(file)
    artist_name, song_name, genre_name = file.split(" - ")
    new(song_name, Artist.find_or_create_by_name(artist_name), Genre.find_or_create_by_name(genre_name.gsub(".mp3",""))) unless find_by_name(song_name)
  end
  
  def self.create_from_filename(file)
    new_from_filename(file).tap{|o| o.save}
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.find_by_name(name)
    all.detect{|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include? self
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include? self
  end
  
  def save
    @@all << self
  end
  
end