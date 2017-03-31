require 'pry'

class Artist

extend Concerns::Findable
attr_accessor :name, :song, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
   artist = self.new(name)
   artist.save
   artist
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless songs.include?(song)
  end

  def genres
   agenres = []
   songs.each do |song|
     agenres << song.genre unless agenres.include?(song.genre)
   end
   agenres
 end




end
