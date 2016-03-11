require 'pry'
require_relative '../concerns/findable.rb'
require_relative '../concerns/print.rb'
class Song
  extend Concerns::Findable
  extend Concerns::Print::ClassMethods
  include Concerns::Print::InstanceMethods
  attr_accessor :name, :genre

  @@all= []

  #///CLASS METHODS///#
  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    artist.add_song(self) if artist
    @genre = genre
    genre.add_song(self) if genre

  end
  def self.create(name,artist=nil,genre=nil)
    song = Song.new(name,artist,genre)
    song.save
    song
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.new_from_filename(filename)
    f=filename.split("-",3)
    artist = Artist.find_or_create_by_name(f[0].strip)
    genre = Genre.find_or_create_by_name(f[2].sub(/.mp3/,"").strip)
    song = Song.new(f[1].strip, artist,genre)
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  def self.print_all
    @@all.each {|song| puts "#{@@all.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  #///INSTANCE METHODS///#
  def save
    @@all << self if !@@all.include?(self)
    @@all.sort!{|a,b| a.artist.name <=> b.artist.name}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.songs.include?(self)
  end
  def artist
    @artist
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end

end
