class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
      if song.genre != self
        #binding.pry
        song.genre = self
      end
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    #binding.pry
    genre
  end

  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
end
