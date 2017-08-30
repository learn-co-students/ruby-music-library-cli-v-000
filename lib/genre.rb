require 'pry'
class Genre
  extend Concerns::Findable
  
  @@all = []

   attr_accessor :name

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
               @@all << Genre.new(name)
             @@all.last
             end
             def songs
               @songs
             end

             def add_song(song)
              song.genre = self unless song.genre
              songs << song unless songs.include?(song)
             end

             def artists
             songs.collect{|x| x.artist}.uniq
             end
end
