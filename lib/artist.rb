require_relative './concerns/memorable.rb'
require_relative './concerns/findable.rb'

class Artist

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist= self
    end
    if @songs.index(song) == nil
      @songs << song
    end
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres = genres.uniq
  end

end
