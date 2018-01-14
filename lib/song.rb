require 'pry'

class Song
  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist != nil ? self.artist = artist : @artist = artist
    genre != nil ? self.genre = genre : @genre = genre
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

  def self.create(artist)
    new_song = self.new(artist)
    new_song.save
    new_song
  end

  def artist=(name)
    @artist = name
    name.add_song(self)
  end

  def genre=(name)
    @genre = name

    if !name.songs.include?(self)
      # binding.pry
      name.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect {|el| el.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    name, title, genre = filename.split(" - ")
    genre = genre.split('.')[0]
    new_song = self.find_or_create_by_name(title)
    new_song.artist = Artist.find_or_create_by_name(name)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
