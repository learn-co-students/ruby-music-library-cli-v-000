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

  def self.create(name)
    song = new(name)
      song.save 
      song
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
  
  def self.new_from_filename(filename)
    # initializes a song based on the filename passed in 
    # uses findable method/module to avoid duplicates
    
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    # initializes and saves song based on filename passed in 
    # uses .new_from_filename instead of recoding
    
    @@all << self.new_from_filename(filename)
  end
end