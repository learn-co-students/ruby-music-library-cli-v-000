class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all.sort_by!{|a| a.name} 
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).tap{|new_song| new_song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist, song, remaining = filename.split(" - ")
    genre, file_format = remaining.split(".")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def pusher
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def save
    @@all << self
  end
end
