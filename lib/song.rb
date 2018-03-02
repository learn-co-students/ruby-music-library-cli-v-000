require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre=(genre) if genre
    self.artist=(artist) if artist
  end

  def self.new_from_filename(filename)
    a = filename.split(" - ").collect {|x| x.strip}.collect {|y| y.chomp(".mp3")}
    artist = Artist.find_or_create_by_name(a[0])
    genre = Genre.find_or_create_by_name(a[2])
    self.new(a[1], artist, genre)
  end

  def self.create_from_filename(filename)
    a = self.new_from_filename(filename)
    a.save
  end


  ["Thundercat", "For Love I Come", "dance"]
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
     genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
      song = new(name)
      song.save
      song
  end

end
