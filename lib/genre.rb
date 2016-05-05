class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
 
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artists
    @songs.collect{|song|song.artist}.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
    if !self.songs.include?(song)
      @songs << song
    end
    if song.genre != self
      song.genre = self
    end
  end


  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end