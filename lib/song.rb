 require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  extend Concerns::Findable


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    s = filename.chomp(File.extname(filename))
    s = s.split(" - ")
    artist = Artist.find_or_create_by_name(s[0])
    genre = Genre.find_or_create_by_name(s[2])
    self.new(s[1], artist, genre)
  end

  def self.create_from_filename(filename)
    s = filename.chomp(File.extname(filename))
    s = s.split(" - ")
    artist = Artist.find_or_create_by_name(s[0])
    genre = Genre.find_or_create_by_name(s[2])
    self.create(s[1], artist, genre)
  end

  def self.destroy_all
    @@all.clear
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end

   def self.sort
     @@all.sort! { |a, b|  b.name <=> a.name}
   end

   def save
     @@all << self
   end

   def to_s
     self.name
   end

end
