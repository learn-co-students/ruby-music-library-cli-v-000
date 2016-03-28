require 'pry'
class Song
extend Concerns::Findable

  attr_accessor :name, :artist, :all, :genre #,:genres, :artists,
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
#       @artist = artist
#       @genre = genre
       self.artist = artist if artist  #Songs and Artists initializing a song with an artist new songs accept an optional argument for the artist
       self.genre = genre if genre #This line makes no impact
      #save
    end

    def self.all
      @@all
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre # necessary
        #genre.song = self Not necessary
        genre.songs << self unless genre.songs.include?(self) #This line a must.
    end

    def add_song(song)
      @song = song
      genre.songs << self unless genre.songs.include?(self)
      @songs << song unless @songs.include?(song)
    end


    def save  #instance method; not for module
        @@all << self
    end

    def self.create(name, artist = nil, genre = nil)
        new(name, artist = nil, genre = nil).tap {|song| song.save} unless self.all.include?(name)
    #  binding.pry #
    end


    def self.new_from_filename(filename)
   # binding.pry
      data =  filename.gsub('.mp3','').split(" - ")  #gsub must be before split
      aartist = Artist.find_or_create_by_name(data[0])
      ggenre = Genre.find_or_create_by_name(data[2])
#       name = ()
      self.new(data[1], aartist, ggenre)
    end
   #binding.pry
#     def self.new_from_filename(filename)
#     #binding.pry
#       data =  filename.split(" - ")
#       @artist = Artist.find_or_create_by_name(data[0])
#       @genre = Genre.find_or_create_by_name(data[2].gsub('.mp3',''))
#       self.find_or_create_by_name(data[1], @artist, @genre)
#     end

      def self.create_from_filename(filename)
        Song.new_from_filename(filename).tap{|song| song.save}
      end

#       @artist = Artist.create(data[0])
#       @genre =Genre.create(data[2].gsub('.mp3',''))
#      self.create(data[1], @artist, @genre)

#       filename.split(" - ")[0] = artist
#       filename.split(" - ")[1] = name
#       filename.split(" - ")[2] = genre
#       data = filename.split(" - ")
#       artist = (data[0])
#       name = (data[1])
#       song = Song.new(name)
#       song.artist = artist
#       #song.artist = Artist.find_or_create_by_name(artist)
#       song.Artist.add_song(song)
#       #song

#binding.pry
    #end
#¸binding.pry



    def self.destroy_all
        self.all.clear #@@all = []
    end

end
#binding.pry
#     def self.find_by_name(name)
#    binding.pry
#        @@all.find{|song| song.name == name}

#     end


#      def self.find_or_create_by_name(name, artist = nil, genre = nil)
# #     #  binding.pry
# #       self.find_by_name(name) || self.create(name)
#         self.create(name, artist = nil, genre = nil) unless self.find_by_name(name)
# # #       @@all.find{|song| song.name == name} || Song.new(name)
#      end
