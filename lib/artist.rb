require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    all_songs.each do |song_obj|
      if !(song_obj.name == song.name)
        all_songs << song
      end
    end

    song.artist = self unless song.artist != nil
  end

  def genres
    arr = []
    self.all_songs.each do |x|
      arr << x.genre
    end
    arr.uniq
  end

  def songs
    @songs
  end
  
  def all_songs
    @songs
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

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
end
# this is uplsdating
