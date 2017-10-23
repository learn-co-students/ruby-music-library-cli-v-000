class Song
  @@all = []
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    self.class.all << self
  end
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  # def self.find_by_name(name)
  #   self.all.detect do |song|
  #     song.name == name
  #   end
  # end
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end
  def self.new_from_filename(name)
    first_split = name.split(" - ")
    artist_name = first_split[0]
    song_name = first_split[1]
    genre_name = first_split[2].split(".")[0]
    s = self.find_or_create_by_name(song_name)
    s.artist = Artist.find_or_create_by_name(artist_name)
    s.genre = Genre.find_or_create_by_name(genre_name)
    s
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
