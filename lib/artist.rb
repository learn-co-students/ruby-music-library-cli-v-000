require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist

    #can also do the following:
    #new(name).tap{|artist| artist.save}

    #What is #tap for?
    #It just allows you do do something with an object inside of a block, and always have that block return the object itself. #tap was created for tapping into method chains, so code like this:

    #def something
      #result = operation
      #do_something_with result
      #result # return
    #end

    # TRADITIONAL
    #object = Model.new
    #object.save!
    #object

    # TAPPED
    #object = Model.new.tap do |model|
      #model.save!
    #end

    # CONDENSED
    #object = Model.new.tap(&:save!)
      #end
    end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless songs.include?(song)
  end

  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq

    #or:
    #self.songs.collect{|s| s.genre}.uniq
  end

 def self.print_artists
    all.each {|artist| puts artist.name}
  end
end