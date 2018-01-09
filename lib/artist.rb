class Artist
  attr_accessor :name
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    #song = Song.new(name)
    #song.save
    #song
    self.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    #if song.artist == nil
      #song.artist = self
    #end
    song.artist ||= self
    self.songs.include?(song) ? self.songs : self.songs << song
  end

  def genres
    genres = self.songs.collect{|song| song.genre}
    genres.uniq
  end
end
