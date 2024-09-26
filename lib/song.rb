require 'pry'

class Song
  extend Basics::ClassMethods, Concerns::Findable
 include Basics::InstanceMethods
 @@all = []
 attr_accessor :name
 attr_reader :artist, :genre

 def initialize(name,artist=nil,genre=nil)
   self.artist=(artist)
   self.genre=(genre)
   @name = name
 end

 def self.all
   @@all
 end

 def artist=(artist)
   if artist.class == Artist
     @artist = artist
     artist.add_song(self)
   end
 end

 def genre=(genre)
   if genre.class == Genre
     @genre = genre
     genre.add_song(self)
   end
 end

 def self.new_from_filename(file)
    file = file.split(" - ")
    song = Song.create(file[1].strip)
    artist = Artist.find_or_create_by_name(file[0].strip)
    genre = Genre.find_or_create_by_name(file[2].gsub(".mp3","").strip)
    song.genre=(genre)
    song.artist=(artist)
    song
  end

  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
    song
  end

end
