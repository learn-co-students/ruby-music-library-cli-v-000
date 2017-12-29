class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.create(type)
    genre = self.new(type)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs<<song
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq

  end

end
