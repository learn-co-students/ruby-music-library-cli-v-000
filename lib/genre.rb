class Genre

  extend Concerns::Findable

  @@all=[]

  attr_accessor :name
  attr_reader :songs


  def initialize(name)
    @name=name
    @songs=[]
    #@@all<<self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all<<self
  end






  def self.create(name)
    genre = new(name)
    genre.save
    genre

  end

  #def songs
    #@songs
  #end

  def artists
    songs.collect {|s| s.artist}.uniq
  end

end
