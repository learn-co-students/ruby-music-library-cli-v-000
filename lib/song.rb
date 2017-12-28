class Song
  extend Concerns::Findable
  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    self.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre == nil || genre.songs.include?(self)
  end

  def self.new_from_filename(filename_ext)
    filename = File.basename(filename_ext, ".mp3")
    artist, name, genre = filename.split(" - ")
    self.new(name).tap do |song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
    end
  end

  def self.create_from_filename(filename_ext)
    self.new_from_filename(filename_ext).save
  end
end
