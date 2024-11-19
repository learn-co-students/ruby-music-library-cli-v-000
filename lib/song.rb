require 'pry'
require_relative './concerns/findable'
class Song
   extend Concerns::Findable

   @@all = []
   attr_accessor :name, :song
   attr_reader :artist, :genre

   def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if artist 
      self.genre = genre if genre     
   end

   # CLASS METHODS

   def self.all
      @@all
   end

   def self.destroy_all
      @@all.clear
   end
   
   def self.create(name)
      created_song = self.new(name)
      created_song.save
      created_song
   end

   def self.new_from_filename(name)
      nameArr = name.split(" - ")
      artist = Artist.find_or_create_by_name(nameArr[0])
      genre = Genre.find_or_create_by_name(nameArr[2].chomp(".mp3"))
      newSong = Song.new(nameArr[1], artist, genre)
      newSong
   end

   def self.create_from_filename(name)
      newSong = self.new_from_filename(name)
      newSong.save
   end

   # INSTANCE METHODS

   def save
      @@all << self
   end

   def artist=(artist)
      @artist=artist
      artist.add_song(self)
   end

   def genre=(genre)
      @genre=genre
      if genre.songs.include?(self)
      else 
         genre.songs << self
      end
   end

end