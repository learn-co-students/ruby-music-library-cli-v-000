require_relative '../concerns/findable.rb'
class Song
  attr_accessor :name
  attr_reader :artist, :genre 
  extend Concerns::Findable 

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist
      self.artist = artist
    end 
    if genre
      self.genre = genre
    end 
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
    new_song = Song.new(name)
    new_song.save 
    new_song 
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end 

  def self.new_from_filename(filename)
    metadata = filename.split(/ - |\./)
    Song.new(metadata[1], Artist.find_or_create_by_name(metadata[0]), Genre.find_or_create_by_name(metadata[2]))
  end 

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save unless @@all.include?(new_song)
    new_song
  end 

  def print
    puts self.artist.name + ' - ' + self.name + ' - ' + self.genre.name
  end

  def self.print_all
    self.all.each_with_index do |song, index|
      print "#{index + 1}. "
      song.print
    end
  end

end 