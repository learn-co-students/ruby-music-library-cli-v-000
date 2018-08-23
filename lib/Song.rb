class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def name
    @name.dup.freeze
  end

  def save
    @@all << self
    @@all.uniq!
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(song, artist = nil, genre = nil)
    x = Song.new(song, artist, genre)
    x.save
    x
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
    self.create(file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
