class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist = artist if artist
    self.genre = genre if genre
  end

  def name=(name)
    @name = name
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
    created = self.new(name).tap {|o| o.save}   # more condensed foobar.tap(&:save)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.chomp!(".mp3").split(" - ")
    self.new(name, Artist.find_or_create_by_name(artist), Genre.find_or_create_by_name(genre))
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
