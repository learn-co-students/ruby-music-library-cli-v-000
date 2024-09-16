class Genre
  attr_accessor :name
  attr_reader :songs
  @@all = []

  extend Concerns::Findable


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

    def add_song(song)
      @songs << song
    end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def artists
    songs.collect{ |a| a.artist }.uniq
  end

end
