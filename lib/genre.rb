require_relative './concerns/findable'
class Genre
   @@all = []
   attr_reader :name
   extend Concerns::Findable

   def initialize(name)
      @name = name
      @songs = []
   end
   # CLASS METHODS

   def self.all
      @@all
   end

   def self.destroy_all
      @@all.clear
   end
   
   def self.create(name)
      created_genre = self.new(name)
      created_genre.save
      created_genre
   end

   # INSTANCE METHODS

   def save
      @@all << self
   end

   def name=(name)
      @name = name
   end

   def songs
      @songs
   end

   def artists
      self.songs.collect{|song|song.artist}.uniq
   end
end