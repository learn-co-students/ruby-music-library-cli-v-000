class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    thing = Genre.new(name)
    thing.save
    thing
  end

  def add_song(song)
    songs << song
  end

  def artists
    thing = self.songs.collect do |song|
      song.artist
    end
    thing.uniq
  end

  def self.create_by_name(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end
