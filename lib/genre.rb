class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  #def name
  #  @name
  #end

  #def name=(name)
  #  @name = name
  #end

  #def add_song(song)
  #  unless @songs.include?(song)
  #    @songs << song
  #  end
  #  if song.genre == nil
  #    song.genre = self
  #  end
  #end

  def songs
    @songs
  end

  def artists
    artists =[]
    @songs.collect do |song|
    artists << song.artist
    end
    artists.uniq
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    genre
  end

end
