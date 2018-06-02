
class Song
  extend Common::ClassMethods
  include Common::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end
  
  def artist=(artist)
    self.artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    self.instance_variable_set(:@genre, genre) unless self.genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    band, title, style = file_name.split(' - ')
    musician = Artist.find_or_create_by_name(band)
    type = Genre.find_or_create_by_name(style[0...-4])
    new_song = self.new(title, musician, type)
    new_song
  end
  
  def self.create_from_filename(filename)
    music = new_from_filename(filename)
    music.save
    music
  end
end
