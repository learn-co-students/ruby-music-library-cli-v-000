require 'pry'

 class Song
   extend Concerns::Findable

   attr_accessor :name, :artist, :genre

   @@all = []

   def initialize(name, artist = nil, genre = nil)
     @name = name
     if artist
       self.artist=(artist)
     end
     if genre
       self.genre=(genre)
     end
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
     song = Song.new(name)
     song.save
     song
   end

   def artist=(artist)
     @artist = artist
     artist.add_song(self)
   end

   def genre=(genre)
     @genre = genre
     genre.add_song(self)
   end

   def self.find_by_name(name)
     @@all.detect do |song|
       if song.name == name
         song
       end
     end
   end


   def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
   end

   def self.new_from_filename(filename)
    #  binding.pry
    newartist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    newgenre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
     if find_by_name(filename.split(" - ")[1]) == nil
       Song.new(filename.split(" - ")[1], newartist, newgenre)
     end
   end

   def self.create_from_filename(filename)
     song = new_from_filename(filename)
     song.save
   end


 end
