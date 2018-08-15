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

  def artist=(artist)
    unless artist.songs.include?(self)
      artist.add_song(self)
    end
    @artist = artist
  end

  def genre=(genre)
    unless genre.songs.include?(self)
      genre.add_song(self)
    end
    @genre = genre
  end

  def save
    @@all << self
  end

  def self.create(name)
    s = self.new(name)
    @@all << s
    s
  end

  # def self.new_by_filename(filename)
  #   split_filename = filename.split(" - ")
  #   song = Song.new(split_filename[1])
  #   song.artist_name = split_filename[0]
  #   return song
  # end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    song = Song.new(split_filename[1])
    song.artist = Artist.find_or_create_by_name(split_filename[0])
    g = split_filename[2]
    song.genre = Genre.find_or_create_by_name(g.split(".").first)
    return song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end
  #
  # def artist_name=(name)
  #   @artist = Artist.find_or_create_by_name(name)
  #   @artist.add_song(self)
  # end

  def self.find_by_name(name)
    if @@all.detect {|s| s.name == name} != nil
      return @@all.detect {|s| s.name == name}
    else
      return nil
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      return self.find_by_name(name)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
