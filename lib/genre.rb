
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    song.genre = self unless song.genre
  end

  def artists
    artists = []
    self.songs.collect do |song|
      artists << song.artist
    end
    artists.uniq
  end


end
