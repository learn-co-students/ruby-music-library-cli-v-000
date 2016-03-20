class Genre
     extend Concerns::Findable

  attr_accessor :name, :song, :songs #, :genre, :artist,  :artists,
  @@all = []

    def initialize(name, song=nil, artist=nil)
        @name = name
        @songs = []
       # @artists = []
       # self.artist = artist if artist
       #self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

#     def artist
#       self.songs.collect do |song|
#         song.artist
#         @song << song.artist unless @song.include?(self)
#       end
#     end

#     def artists
#        @songs.collect do |artist|
#         # binding.pry
#          song.artist
#        #  @artists << song.artist unless @artists.include?(self)
#        end
#     end

#     def add_song(song)
#       @songs << song
#     end

    def songs
      @songs
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name, song=nil, artist=nil)
      new(name, song=nil, artist=nil).tap {|genre| genre.save}

    end
end
