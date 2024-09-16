class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
    new_song = new(name, artist, genre)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create(name)
    else
      find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    artist, name, genre_name = filename.split(" - ")
    fixed_genre = genre_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_genre)
    new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
