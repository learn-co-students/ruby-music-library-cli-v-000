require "pry"
class Artist
  extend Findable::ClassMethods  #share class methods from Findable module
  include Findable::InstanceMethods #share instance class methods from Findable module

  attr_accessor :name, :songs

  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
    @songs =[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << Song.new(name)
  end

  # instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately.
  def self.create(artist)
    artist = Artist.new(name)
    artist.save
    artist
  end

  # artist has many songs.
  def add_song(song)
    if song.artist!=self
      song.artist = self
    elsif !@songs.include?(song)
      @songs << song
    end
    # binding.pry

  # artist have many gnres through songs
  def genres
    songs.collect{|song| song.genre}.uniq
      #unless songs.include?(song.genre)
      # binding.pry
    # end
  end
  end

end
