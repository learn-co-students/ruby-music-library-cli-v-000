require'pry'
class Artist

  attr_accessor :name, :songs, :genres
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end

  def add_song(song)
    if songs.include?(song) == false
      songs << song
      if song.artist == nil
        song.artist = self
      end
    end
  end

  def genres
    #songs[0].genre.name
    genre = songs.collect {|song| song.genre}
    genre.uniq
  end


end