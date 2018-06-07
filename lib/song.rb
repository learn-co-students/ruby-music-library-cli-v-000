class Song
  attr_accessor :name
  attr_reader  :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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
    self.new(name).tap do |song|
    song.save
    end
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(name)
   find_by_name(name) || create(name)
  end

   def self.new_from_filename(file)
    file = file.split(/\.| - /)

    Song.new(file[1]).tap do |song|
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    end
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).save
  end

end
