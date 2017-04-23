
class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(new_song)
    if new_song.class == Song && !self.songs.any? {|song| song == new_song}
         self.songs << new_song
         new_song.artist = (self)
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end



end
