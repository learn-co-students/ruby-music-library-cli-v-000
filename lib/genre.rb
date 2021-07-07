class Genre
extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader
  @@all= []
  def initialize(name)
    @name=name
    @songs= []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @all= []
  end
  def save
    @@all << self
    self
  end
  def self.create(name)
    genre= new(name)
    genre.save
  end
  def add_song(song)
    #if !song.genre
      @songs << song if !@songs.include?(song)
    #  song.genre= self
    #end
    @songs
  end
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
  def self.destroy_all
    @@all= []
  end

end
