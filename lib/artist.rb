class Artist
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
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name).tap {|x| x.save}
    artist
  end

  def save
    Artist.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end
end
