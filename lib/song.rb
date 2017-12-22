class Song
   
   attr_accessor :name, :artist, :genre
   
   @@all = []
   
   def self.all
      @@all 
   end
   
   def self.destroy_all
      @@all.clear 
   end
   
   def initialize(name, artist=nil, genre=nil)
      # binding.pry
       @name = name
       self.genre = genre if genre != nil
       self.artist = artist if artist != nil
       save
   end
   
   def save
      @@all << self 
   end
   
   def self.create(name)
      Song.new(name)
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
      @@all.detect {|song| song.name == name}
   end
   
   def self.find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
   end
   
   def self.new_from_filename(filename)
      artist, song, genre = filename.split(/\s-\s|\..*/)
      # g = Genre.find_or_create_by_name(genre)
      # a = Artist.find_or_create_by_name(artist)
      Song.new(song, Artist.find_or_create_by_name(artist), Genre.find_or_create_by_name(genre))
   end
   
   def self.create_from_filename(filename)
      # binding.pry
      new_from_filename(filename)
   end
   
end