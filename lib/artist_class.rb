require_relative '../concerns/findable_module.rb'

class Artist
  #extend Concerns::CommonUtil
  #extend Concerns::Findable
  include Concerns

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist ||= self
    unless @songs.include? song 
      @songs << song
    end
  end

  def genres
    @songs.map {|song| song.genre}.uniq
  end

  def save
    Artist.all << self
    self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
  end

  def self.all
    @@all
  end

  #def self.destroy_all
  #  self.all.clear
  #end
end