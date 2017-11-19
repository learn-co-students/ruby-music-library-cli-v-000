class Song
  extend Memorable::ClassMethods#, #Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre
  #attr_reader :artist, :genre

  @@all=[]

  def initialize(name, artist="", genre="")
    @name=name
    self.artist=artist unless artist==""
    self.genre=genre unless genre==""
    #@@all<<self
    #@genre=genre
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    puts @@all.detect{|a| a.name==name}
    @@all.detect{|a| a.name==name}
  end

  def save
    @@all<<self
  end

end
