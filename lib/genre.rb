

 class Genre
   extend Concerns::Findable

   attr_accessor :name, :songs

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
     genre = Genre.new(name)
     genre.save
     genre
   end

   def add_song(song)
     if !song.genre
       song.genre = self
     end
     if !@songs.include?(song)
       @songs << song
     end
   end

   def artists
     artists = []
     self.songs.collect {|song| artists << song.artist}
     artists.uniq
   end


 end
