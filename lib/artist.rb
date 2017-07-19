class  Artist
  attr_accessor :name, :song, :genre
  extend Concerns::Findable

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

  def songs
    @songs
  end

  def self.create(name)
    artist = self.new(name)
    artist.save #save this instance
    artist #return
  end

  def add_song(song)
    @songs.include?(song) ? true : @songs << song
    if song.artist == nil
      song.artist = self #self = current Artist object, tells song it belongs to that artist
    end
  end

  def genres
    songs.collect {|song| song.genre #iterate over songs array to pull nested genre into array.uniq w/no duplicate generes
    }.uniq
  end

end
