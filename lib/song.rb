class Song
  extend Memorable::ClassMethods, Concerns::Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre
  #attr_reader :artist, :genre

  @@all=[]

  def initialize(name, artist="", genre="")
    @name=name
    self.artist=artist unless artist==""
    self.genre=genre unless genre==""
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

  def self.save
    all<<self
  end

  def self.new_from_filename(filename)
    #puts filename

    parameters=filename.split(/\s-\s/)
    #puts parameters[2].split(".")[0]
    self.new(parameters[1],Artist.new(parameters[0]),Genre.new(parameters[2].split(".")[0])) if find_by_name(parameters[1])==NilClass
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
    #puts all
    #parameters=filename.split(/\s-\s/)
    #self.new(parameters[1],Artist.new(parameters[0]),Genre.new(parameters[2].split(".")[0])) if find_by_name(parameters[1])==NilClass
  end

end
