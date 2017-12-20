
require_relative '../lib/concerns/memorable.rb'
require_relative '../lib/concerns/findable.rb'

require 'pry'

class Song

  extend Memorable::ClassMethods
  extend Concerns::Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    #puts "artist = #{artist} || genre = #{genre}"

    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    #puts "filename = #{filename}"
    song = self.find_or_create_by_name(filename.split(" - ")[1])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = genre
    artist.add_song(song)
    #puts "song name = #{song.name} || artist = #{song.artist.name} || genre = #{song.genre.name}"
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
