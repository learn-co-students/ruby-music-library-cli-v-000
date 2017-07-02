


class Genre

  attr_accessor :name, :songs, :artists
  @@all
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def artists
    collection_array = @songs.collect{ |song| song.artist}
    collection_array .uniq
  end

end
