class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
   song.artist = self if song.artist == nil
   @songs << song if @songs.include?(song) == false
  end

  def genres
   genre_collection = @songs.map {|song| song.genre}
   genre_collection.uniq
  end

end
