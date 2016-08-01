class Genre
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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).save
    self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = @songs.collect do |song|
      song.artist
    end

    artists.uniq
  end
end