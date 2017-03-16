require 'pry'
require_relative './artist.rb'
require_relative './genre.rb'
require_relative './music_importer.rb'
require_relative './concerns/findable.rb'

class Song
  extend Findable

  attr_accessor :name, :artist
  attr_reader :genre
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def initialize(name, a = nil, g = nil)
    self.name = name
    self.assign_artist(a) unless a == nil
    self.genre=(g) unless g == nil
  end

  def self.create(name)
    self.new(name).tap do |song|
      @@all << song
    end
  end

  def save
    @@all << self
  end

  def assign_artist(a)
    a.class == Artist ? artist = a : artist = Artist.find_or_create_by_name(a)
    # at this point artist == #<Artist:0x00000000ad37e8 @name="Maps", @songs=[]>
    # and self == #<Song:0x000000015bb9d0 @name="It's Real">
    artist.add_song(self) # => this returns the song
    artist
  end

  def genre=(g)
    g.class == Genre ? @genre = g : @genre = Genre.find_or_create_by_name(g)
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    song_data = filename.split(/ - |[.]/)
    self.new(song_data[1]).tap do |song|
      song.assign_artist(song_data[0])
      song.genre=(song_data[2])
    end
  end

  def self.create_from_filename(filename) # could probably improve by adding the Songs.all << self method to the self.new_from_filename rahter than building from scratch
    song_data = filename.split(/ - |[.]/)
    self.create(song_data[1]).tap do |song|
      song.assign_artist(song_data[0])
      song.genre=(song_data[2])
    end
  end

  def self.sort_songs
    self.all.sort {|a,b| a.artist.name <=> b.artist.name}
  end

  def song_attributes
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def self.list_songs
    self.sort_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.song_attributes}"
    end
  end

  def self.play_song(n)
    index = n - 1
    song = self.sort_songs[index]
    puts "Playing #{song.song_attributes}"
  end
end

# hat = Song.new("It's Real")
#
# hat.assign_artist("Maps")

# binding.pry
