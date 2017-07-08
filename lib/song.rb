require_relative './concerns/memorable.rb'
require_relative './concerns/findable.rb'

class Song

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist ='', genre='')
    @name = name
    if artist != ''
      self.artist=(artist)
    end
    if genre != ''
      self.genre=(genre)
    end
  end


  def self.all
    @@all
  end

  def artist=(artist)
    @artist= artist
    artist.add_song(self)
  end

   def genre=(genre)
     @genre= genre
     genre.add_song(self)
   end

   def self.find_by_name(name)
     @@all.detect{|song| song.name == name}
   end

   def self.find_or_create_by_name(name)
    if self.all.detect{|song| song.name == name}
      self.all.detect{|song| song.name == name}
    else
      self.create(name)
    end
   end

   def self.new_from_filename(filename)
     song = Song.find_or_create_by_name(filename.split(" - ")[1])
     song.artist= Artist.find_or_create_by_name(filename.split(" - ")[0])
     song.genre= Genre.find_or_create_by_name(filename.split(" - ")[2].chomp('.mp3'))
     song
   end

   def self.create_from_filename(filename)
     song = Song.new_from_filename(filename)
     song.save
     song
   end



end
