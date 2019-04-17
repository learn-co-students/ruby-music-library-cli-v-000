class Song
  extend Findable

  @@all = []
  attr_accessor :name, :genre
  attr_reader   :artist

  def initialize(song_name, artist=nil, genre=nil)
    @name = song_name
    self.artist = artist if artist
    self.genre  = genre if genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
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

  def self.create(song_name)
    Song.new(song_name).tap{|s| s.save}
  end

  def self.find_by_name(song)
    self.all.find {|s| s.name == song }
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song).nil? ? self.create(song) : self.find_by_name(song)
  end
end
