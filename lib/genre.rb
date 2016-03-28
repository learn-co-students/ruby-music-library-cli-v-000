class Genre #keeps a list of songs
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

    def artists
      self.songs.collect{ |song| song.artist}.uniq
#        self.songs.collect do |artist|
#          song.artist unless @songs.include?(artist)
#        #  @artists << song.artist unless @artists.include?(self)
#        end
    end

#     def add_song(song)
#       @songs << song
#     end

    def songs
      @songs
    end

    def self.destroy_all
        self.all.clear # @@all = []
    end

    def self.create(name) #, song=nil, artist=nil
      new(name).tap {|genre| genre.save} #, song=nil, artist=nil
    end
 #  binding.pry
end
