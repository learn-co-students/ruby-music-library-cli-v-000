
class Artist

  extend Concerns::Findable


  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all.dup.freeze
  end
  def save
    @@all << self
    self
  end
  def self.destroy_all
    @@all.clear
  end


  def self.create(name)
    self.new(name).save
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist != nil
  end
  def songs
    @songs
  end
  def genres
    genre = []
    @songs.collect do |song|
      genre << song.genre
    end
    genre.uniq
  end
end
