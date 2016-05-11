require 'pry'
class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def add_song(song)
   if song.artist != self
      song.artist = self
   end
   if @songs.include?(song) == false
       @songs << song
    end
  end


  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    @songs.map { |song| song.genre }.uniq
  end

end

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).select {|x| !File.directory? x}
  end

  def import
    self.files.collect do |file|
      song = Song.new_by_filename(file)
      song
    end
 end

end