class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # Class reader
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    songs << song unless songs.include?(song) #Add the instance of song to the songs array, unless the songs array already includes the instance of the song
    song.artist = self unless song.artist == self #The song instance's artist is an instance of artist unless the song instance already has an instance of an artist
  end

  def genres
      songs.map{|song| song.genre}.uniq
    end

end
