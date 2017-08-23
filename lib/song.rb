require 'pry'
class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
    end
    def self.all
        @@all
    end
    def save
        @@all << self
    end
    def self.create(name)
        song = self.new(name)
        song.save
        song
    end
    def self.destroy_all
        self.all.clear        
    end
   def artist=(artist)
       @artist = artist
       artist.add_song(self)  
   end
   def genre=(genre)
       @genre = genre
       genre.add_song(self)  
   end
#    def self.find_by_name(name)
#        self.all.find{|s|s.name == name}
#    end
   def self.new_from_filename(file_name)
     
      @new_artist = Artist.find_or_create_by_name(file_name.split(' - ')[0])
    #   binding.pry 
      @new_genre = Genre.find_or_create_by_name(file_name.split(' - ')[2].gsub(".mp3",""))
      @new_song = Song.new(file_name.split(' - ')[1], @new_artist, @new_genre)
      @new_song
   end
   def self.create_from_filename(file_name)
      self.new_from_filename(file_name).save
   end

end
