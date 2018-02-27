require 'pry'

class Artist

attr_accessor :name, :artist, :genres
attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name) #Instance_method
    @name = name
    @songs = []
  #  @genres = []
    #binding.pry

  end

  def genres
  @songs.map(&:genre).uniq
  end




  def self.create(name) #Class method
    name = Artist.new(name)
    name.save
    name
  end

  def self.all #class_method
    @@all
  end

  def add_song(song) #instance
      song.artist = self unless song.artist
      @songs << song unless @songs.include? song

  end

  def self.destroy_all #class_method
    self.all.clear
  end

  def save #Instance_method
    @@all << self
  end

  # def genres
  #   @genres
  # end

end
