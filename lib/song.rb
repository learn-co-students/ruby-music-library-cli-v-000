class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre

  @@all=[]

  def initialize(name, artist="", genre="")
    @name=name
    #@artist=artist
    @artist=artist
    @genre=(genre)
  end

  def self.all
    @@all
  end

  def self.create(name, artist="")
    self.new(name,artist).save
    self
  end

  def artist=(artist)
    @artist=artist
    #artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end


end
