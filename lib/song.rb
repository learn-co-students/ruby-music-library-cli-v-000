class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).tap { |song| song.save }
  end

  def self.destroy_all
    all.clear
  end

=begin
  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
=end

  def self.new_from_filename(file)
    file_artist, file_song, file_genre = file.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_artist)
    genre = Genre.find_or_create_by_name(file_genre)
    Song.new(file_song, artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap { |song| song.save }
  end

end
