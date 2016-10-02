require_relative "../lib/concerns/findable.rb"
class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song 
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    artist.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)  
    song = filename.split(" - ") 
    song_name = song[1] 
    song_artist = song[0]
    song_genre = song[2].gsub(".mp3", "")
    
    artist = Artist.find_or_create_by_name(song_artist)  
    genre = Genre.find_or_create_by_name(song_genre)     
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename) 
    song = filename.split(" - ") 
    song_name = song[1] 
    song_artist = song[0]
    song_genre = song[2].gsub(".mp3", "")
      
    artist = Artist.find_or_create_by_name(song_artist)  
    genre = Genre.find_or_create_by_name(song_genre)     
    self.create(song_name, artist, genre)
    end

    def attributes
      "#{self.artist.name} - #{self.name} - #{self.genre.name}"
    end
end