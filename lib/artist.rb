class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist.nil?
      song.artist = self
    end
  end
  
  def genres
    genres = []
    songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end
  
end