require_relative '../concerns/modules.rb'
require_relative 'MusicLibraryController.rb'
require 'pry'


##########_____SONG_____##########
class Song
  extend Concerns::Destroy_Create
  include Concerns::Save
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all=[]
  def initialize(name, artist=nil, genre=nil)
    @name=name
    artist.add_song(self) if artist
    @genre=genre
    (genre.songs << self) if (genre && !(genre.songs.include?(self)))
  end

  def self.all
    @@all
  end

  def self.all=(all)
    @@all=all
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    (genre.songs << self) if !(genre.songs.include?(self))
  end

  def self.new_from_filename(filename)
    attributes=filename.split(" - ")
    attributes << attributes.pop.split(".mp3")[0]
    artist = Artist.find_or_create_by_name(attributes[0])
    genre = Genre.find_or_create_by_name(attributes[2])
    new_song = self.new(attributes[1], artist, genre)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

end




##########_____ARTIST_____##########
class Artist
  extend Concerns::Destroy_Create
  extend Concerns::Findable
  include Concerns::Save
  attr_accessor :name, :songs, :genres
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end

  def self.all=(all)
    @@all=all
  end


  def add_song(song)
    (song.artist = self) if !(song.artist==self)
    (@songs << song) if !(@songs.include?(song))
  end

end



##########_____GENRE_____##########
class Genre
  extend Concerns::Destroy_Create
  extend Concerns::Findable
  include Concerns::Save
  attr_accessor :name, :songs
  @@all=[]
  def initialize(name)
    @name=name
    @songs=[]
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.all=(all)
    @@all=all
  end

end





class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files=[]
  end

  def files
    entries = Dir.entries(@path)

    mp3_files=[]
    entries.each do |entry|
      mp3_files << entry if entry.match(/.mp3/)
    end
    @files = mp3_files.select{|entry| entry.delete(@path)}
    @files
  end

  def import
    self.files.each do |filename|
      song = Song.create_from_filename(filename)
    end
  end


end

