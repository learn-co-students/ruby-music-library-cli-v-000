require 'pry'
class Song
extend Concerns::Findable

  attr_accessor :name, :artist, :genre #,:genres, :artists,
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
#       @genres = []
#       @artists = []
       self.artist = artist if artist  #Songs and Artists initializing a song with an artist new songs accept an optional argument for the artist
       self.genre = genre if genre #This line makes no impact

    end

    def self.all
      @@all
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.song = self
        genre.songs << self unless genre.songs.include?(self) #This line a must.
    end

    def add_song(song)
    #  genre.song = self
      #genre.song = self
      genre.songs << self unless genre.songs.include?(self)
      #song.genre = self unless song.genre == self
      @songs << song unless @songs.include?(song)
    end


    def save  #instance method; not for module
        @@all << self
    end

    def new_from_filename(filename)
    end


    def self.create(name, artist = nil, genre = nil)
        new(name, artist = nil, genre = nil).tap {|song| song.save}
    end

#     def self.find_by_name(name)
#    #binding.pry
#        @@all.find{|song| song.name == name}

#     end


#     def self.find_or_create_by_name(name)
#     #  binding.pry
#       self.find_by_name(name) || self.create(name)
#     #  self.create(name, artist = nil, genre = nil) unless self.find_by_name(name)
# #       @@all.find{|song| song.name == name} || Song.new(name)
#     end


    def self.destroy_all
        self.all.clear #@@all = []
    end
end
