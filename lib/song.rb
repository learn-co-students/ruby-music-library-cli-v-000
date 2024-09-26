class Song

  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist != nil
    genre.add_song(self) if genre != nil
    end

  def self.all 
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def Song.create(name)
    song = self.new(name)
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self unless artist.songs.include?(self)
    artist.add_song(self) 
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    genre.add_song(self)
  end

def self.new_from_filename(filename)
  array = filename.chomp(".mp3").split(/\s[-]\s/)
  song = self.new(array[1]) 
  song.artist = Artist.find_or_create_by_name(array[0])
  song.genre = Genre.find_or_create_by_name(array[2])
  song
end

def self.create_from_filename(filename)
  array = filename.chomp(".mp3").split(/\s[-]\s/)
  song = self.new(array[1]) 
  song.artist = Artist.find_or_create_by_name(array[0])
  song.genre = Genre.find_or_create_by_name(array[2])
  song.save
  song
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end