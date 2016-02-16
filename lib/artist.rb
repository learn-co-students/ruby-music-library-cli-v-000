class Artist
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

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    else
      if !@songs.include?(song)
        @songs << song
      end
    end
    song
  end

end