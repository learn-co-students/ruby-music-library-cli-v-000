require 'pry'
class Artist
  extend Concerns::Findable
  
  @@all = []

   attr_accessor :name, :songs

     def initialize(name)
       @name = name
       @songs = []
     end

       def self.all
         @@all
       end

         def self.destroy_all
           @@all = []
         end

           def save
             @@all << self
           end

             def self.create(name)
               @@all << Artist.new(name)
             @@all.last
             end

                def songs
                  @songs
                end

                def add_song(song)
                 song.artist = self unless song.artist
                 songs << song unless songs.include?(song)
                end

                def genres
                  songs.collect{ |s| s.genre }.uniq
                end
end
