class Genre
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name=name
    self.save
    @songs = []
  end

  def artists
    artists_array = []
    @songs.each do |song|
      artists_array << song.artist
    end  #.uniq!
    artists_array = artists_array.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all=[]
  end

  def save
    @@all << self
  end

  def self.create(name)
    name = Genre.new(name)

  end

end
