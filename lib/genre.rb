require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs #each genre's attributes
  @@all = [] #initialize collection of all class members as an empty array

  def initialize(name) #initialize with a name, store as name
    @name = name
    @songs = []
  end

  def save #pushes the instance onto the class var @@all
    @@all << self
  end

  def self.all #class var @@all reader
    @@all
  end

  def self.destroy_all #clears class var @@all
    @@all.clear
  end

  def self.create(name) #instantiates a new class member by calling initialize and then saves it by calling save
    new(name).tap{ |i| i.save }
  end

  def self.find_by_name(name)
    self.all.detect { |member| member.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def add_song(song)
    self.songs << song
  end

  def artists
    @songs.map { |i| i.artist }.uniq
  end

end
