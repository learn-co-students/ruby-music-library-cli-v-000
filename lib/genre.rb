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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    myobj = self.new(name)
    @@all << myobj
    myobj
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    else
      if !@songs.include?(song)
        @songs << song
      end
    end
    song
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end