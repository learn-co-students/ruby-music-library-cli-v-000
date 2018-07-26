class Genre
  extend Concerns::Findable

attr_accessor :name
attr_reader :songs #:artist - why wouldn't you need an artist variable? Aren't you referring to it #artists method - No! that is the artist variable from the song class.


@@all = []

  def initialize(name)
    @name= name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    @@all << self
  end


  def self.create(name)
    this_genre = Genre.new(name)
    this_genre.save
    this_genre
  end


  def artists
    self.songs.map do |song|
    song.artist
  end.uniq #works because you are returning an array which uniq can operate on
  end

end
