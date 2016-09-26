class Song
  extend Concerns::Findable

  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist then self.artist = artist end
    if genre then self.genre = genre end
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    artist = split[0]
    name = split[1]
    genre = split[2].slice(0, (split[2].length) - 4)
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    if self.find_by_name(name).nil?
      self.new(name, artist, genre)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|s| s.save}
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).tap{|s| s.save}
  end
end