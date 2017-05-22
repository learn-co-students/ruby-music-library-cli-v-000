class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.create(name)
    self.new(name).save[-1]
  end
  def self.new_from_filename(filename)
    filename = filename.split(".")[0].split(" - ")
    self.new(filename[1], Artist.find_or_create_by_name(filename[0]),
              Genre.find_or_create_by_name(filename[2]))
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save[-1]
  end
  # Individual instances
  def initialize(name, artist=nil, genre=nil)
    self.artist = artist if artist # calls the artist= method
    self.genre = genre if genre # using self calls the genre= method
    @name = name
  end
  def save
    @@all << self
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
end
