class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    own_songs = self.songs.collect{|song| song.genre}
    own_songs.uniq
  end
end