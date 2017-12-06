class Artist

  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name=name
    self.save
    @songs = []
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
    genres = genres.uniq
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    unless @songs.detect {|i| i == song }
      @songs << song
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all << self
  end

  def self.create(name)
    name = Artist.new(name)
  end

  def songs
    @songs
  end

end
