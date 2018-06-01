
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
  
    def save
      self.class.all << self
    end
  
    def destroy_all
      self.all.clear
    end

  def add_song(song)
    @songs << song unless songs.include?(song)
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end
