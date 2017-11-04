class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist if artist
    @genre = genre if genre
  end

  def artist=(artist_object)
    @artist = artist_object
  end

  def genre=(genre_object)
    @genre = genre_object
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save(song)
    @@all << song
  end

  def self.create(name)
    song = self.new(name)
    song.save
  end

end
