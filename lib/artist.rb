require'pry'
class Artist

  attr_accessor :name, :songs, :genres, :artists

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
    self.new(name)
    self.all << self
    self
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
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

  def artists
    artist = songs.collect {|song| song.artist}
    artist.uniq
  end


end