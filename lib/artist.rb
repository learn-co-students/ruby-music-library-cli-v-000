
class Artist
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


  def add_song(song)
      song.artist = self unless song.artist
      @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def self.create(name)
    created_artist = self.new(name)
    @@all << created_artist
    created_artist
  end

end
