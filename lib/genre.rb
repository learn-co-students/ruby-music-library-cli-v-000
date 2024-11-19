class Genre
attr_accessor :name
attr_reader :songs
@@all = []
extend Concerns::Findable

def initialize(name)
  @name = name 
  @songs = []
end

def save 
  @@all << self 
end 

def self.all 
  @@all 
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
    if @songs.include?(song) == false 
      if song.genre == nil
   @songs << song
   song.genre = self
   end
 end
end

def artists
  @songs.collect {|song| song.artist}.uniq 
end

end 