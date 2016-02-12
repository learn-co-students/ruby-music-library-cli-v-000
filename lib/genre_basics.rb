require_relative "../concerns/findable_module.rb"

class Genre
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name, :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if self.songs.include?(song) == false
      @songs << song
      self.artist = song.artist
    end
  end

  def self.all 
    @@all  
  end

  def artists
    songs.collect {|i| i.artist}.uniq
  end


end