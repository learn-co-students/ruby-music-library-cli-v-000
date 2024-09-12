class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
    song.artist = self
  end
  if self.songs.include?(song) == false
     self.songs << song
   end
  end


  def name
    @name
  end

  def name=(name)
    @name = name
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
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    new_array = []
    self.songs.collect do |song|
      new_array << song.genre
    end
    new_array.uniq
  end


end
