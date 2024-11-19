require_relative "./artist.rb"
require_relative "./genre.rb"
require_relative "./musicimporter.rb"

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, art = nil, gen = nil)
    self.name = name
    self.artist=(art)
    self.genre=(gen)
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
    x = self.new(name)
    x.save
    x
  end

  def artist=(artist)
    if artist == nil
      @artist = nil
    else
      @artist = artist
      self.artist.add_song(self)
    end
  end

  def genre=(gen)
    if gen == nil
      @genre = nil
    else
      @genre = gen
      gen.add_song(self)
    end
  end

  def self.find_by_name(name)
    self.all.detect {|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(/ - |.mp3/)
    Song.new(data[1]).tap do |song|
      x = Artist.find_or_create_by_name(data[0])
      song.artist = x
      y = Genre.find_or_create_by_name(data[2])
      song.genre = y
    end
  end

  def self.create_from_filename(filename)
    x = self.new_from_filename(filename)
    x.save
    x
  end
    
end

