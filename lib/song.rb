class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
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

  def self.create(name, artist = nil, genre = nil)
    new_from_filename = self.new(name, artist, genre)
    new_from_filename.save
    new_from_filename
  end

  def artist=(artist)
    if @artist != artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if @genre != genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.new_from_filename(filenames)
    fields = filenames.split(" - ")
    artist = Artist.find_or_create_by_name(fields[0])
    genre = Genre.find_or_create_by_name(fields[2].split(".mp3")[0])
    self.new(fields[1], artist, genre)
  end

  def self.create_from_filename(filenames)
    fields = filenames.split(" - ")
    artist = Artist.find_or_create_by_name(fields[0])
    genre = Genre.find_or_create_by_name(fields[2].split(".mp3")[0])
    self.create(fields[1], artist, genre)
  end

end
