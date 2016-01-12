require_relative '../concerns/findable.rb'
# require_relative '../concerns/class_actionable.rb'
# require_relative '../concerns/instance_actionable.rb'

class Song
  extend Concerns::Findable
  # extend Concerns::ClassActionable

  attr_accessor :name, :genre, :artist

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    Song.new(data[1], Artist.find_or_create_by_name(data[0]), Genre.find_or_create_by_name(data[2].gsub('.mp3','')))
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save unless @@all.include?(song)
    song
  end

  def self.print_all
    self.all.each_with_index {|e, i| puts "#{i+1}. e"}
  end

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def print
    puts self.artist.name + ' - ' + self.name + ' - ' + self.genre.name
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end
end