#require 'pry'
#require_relative '../lib/concerns/memorable'
class Song
  #extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name, :genre

   #This was in a class module but created issues with the import method
   @@all = []

    def self.all
      @@all
    end
    
     def self.destroy_all
     self.all.clear
     end
  #--------------------------------

  #-----Artist setter & getters--------
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
   end

   def artist
    @artist
  end

  #-----Genre setter & getters----------
   def genre= (genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
   end

   def genre
    @genre
  end

  #-------Song initializaton-----------

   def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      artist.add_song(self)
    end
    if genre != nil
      self.genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end



  def self.new_from_filename(filename)
  split_array = filename.split(/\.mp3| - /)
  newsong = Song.create(split_array[1])
  newsong.artist = Artist.find_or_create_by_name(split_array[0])
  newsong.genre  = Genre.find_or_create_by_name(split_array[2]) 
  newsong
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
end


end
