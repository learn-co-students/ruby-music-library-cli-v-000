class Genre
     extend Concerns::Findable

  attr_accessor :name, :song, :artist, :songs #, :genre, :artists
  @@all = []

    def initialize(name, song=nil, artist=nil)
        @name = name
        @songs = []
        @artists = []
       # self.artist = artist if artist
       #self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

#     def songs
#      self.songs.collect do |song|
#       #  binding.pry
#     # song.genre
#      song.genre = self unless song.genre == self
#      @songs << song unless @songs.include?(song)
#      @genres << genre unless @genres.include?(genre)
#      end
#     end


#     def artists=(artist)
#         @artist = artist
#         song.artist.genre = self unless song.artist.genre == self
#         @artists << artist unless @artists.include?(artist)
#     end

    def artists
      self.songs.collect do |song|
       # song.artist
        song.artist.genre = self unless song.artist.genre == self
        @artists << artist unless @artists.include?(artist)
      end
    end
  
    def songs
      @songs
    end

#     def genre=(genre)
#       @genre = genre
#       genre.songs << self unless genre.songs.include?(self)
#     end

#     def add_song(genre) #This block: no effect on anything
#       @genre = genre
#       song.genre = self unless song.genre == self
#       @songs << song unless @songs.include?(song)
#     end


    def self.destroy_all
        @@all = []
    end

    def self.create(name, song=nil, artist=nil)
      new(name, song=nil, artist=nil).tap {|genre| genre.save}
#         self.new
#         self.save
    end
end
