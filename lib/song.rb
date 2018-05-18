require 'pry'


class Song 
extend Concerns::Findable
extend Memorable::ClassMethods 
include Memorable::InstanceMethods
  
attr_accessor :name, :artist
attr_reader :genre
  @@all = []  
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
    save
  end 
  
  def self.all 
    @@all 
  end 
  
  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre 
  end
  
  def artist=(artist)
     @artist =artist
     @artist.add_song(self)
  end
  
  # def self.find_by_name(name) 
  #   self.all.detect {|a| a.name == name}
  # end 
  
  # def self.find_or_create_by_name(name)
  #   x = self.find_by_name(name)
  #   if x == nil 
  #     self.create(name)
  #   else
  #     x
  #   end
  # end
  
  # def alphabetical
  #   self.all.sort_by{|s| s.name}
  # end
  
   def self.new_from_filename(file_format)
     artist_name, song_name, genre_name = file_format.chomp(".mp3").split(" - ")
     s = self.new(song_name)
     s.artist = Artist.find_or_create_by_name(artist_name)
     s.genre = Genre.find_or_create_by_name(genre_name)
     s
   end
  
   def self.create_from_filename(file_format)
     s = self.new_from_filename(file_format)
     s.save
     s
   end
end
  

