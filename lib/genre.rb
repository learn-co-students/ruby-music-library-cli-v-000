class Genre 

  extend Concerns::Findable
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
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
    self.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
      if song.genre == nil
        song.genre = self
      end

      if @songs.include?(song) == false
        @songs << song
      end
  end

  def artists
    songs.map{|song|song.artist}.uniq
  end

end
