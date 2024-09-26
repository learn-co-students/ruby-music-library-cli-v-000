require_relative './concerns/memorable.rb'
require_relative './concerns/findable.rb'

class Genre

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
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


  def songs
    @songs
  end

  def add_song(song)
    if song.genre == nil
      song.genre= self
    end
    if @songs.index(song) == nil
      @songs << song
    end
  end

  def artists
    artists = @songs.collect {|song| song.artist}
    artists = artists.uniq
  end

end
