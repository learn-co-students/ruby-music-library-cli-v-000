class Genre

  extend Concerns::Findable

  attr_accessor :name
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
    self.new(name).tap do |genre|
      genre.save
    end
  end

  def songs
    @songs
  end


  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end


  def artists
    artists = @songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end
