require_relative '../concerns/music_module'
class Genre < Music
  attr_accessor :artist
  extend Concerns::Findable
  @@all_genres=[]
  def initialize(name)
    super
    @songs=[]
  end

  def self.create(name)
    new_item = self.new(name)
    self.all<< new_item
    return new_item
  end

  def songs
    @songs
  end

  def add_song(song)
    if self.songs.include?(song) == false
    self.songs<<song
        song.genre= self
    end
  end

  def artists_notuniq
    @songs.collect {|song| song.artist}
  end

  def artists
    self.artists_notuniq.uniq
  end

  def save
    @@all_genres << self
  end

  def self.destroy_all
    @@all_genres=[]
  end

  def self.create(name)
    new(name).tap {|a| a.save}
  end

  def self.all
    @@all_genres
  end


end
