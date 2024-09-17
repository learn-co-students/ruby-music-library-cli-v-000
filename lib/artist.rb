class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song  unless @songs.include?(song)  
  end

  # def add_song(song)
  #
  #   if song.artist == self
  #   else
  #     song.artist = self
  #   end
  #   # binding.pry
  #   if @songs.include?(song)
  #   else
  #     @songs << song
  #   end
  # end
end
