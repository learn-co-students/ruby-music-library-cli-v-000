class Artist
   extend Concerns::Findable


  attr_accessor :name, :song, :genre, :songs, :genres
  @@all = []

    def initialize(name, song=nil, genre=nil)
        @name = name
        @songs = []
        @genres = []

        #@song.artist = self
        #@@all << self
    end

#     def genres
#       self.songs.collect do |song|
#       #  binding.pry
#         song.genre
#       end
#     end
#binding.pry
    def genres
     self.songs.collect do |song|
      #  binding.pry
          song.genre.uniq  #comment out uniq
#        song.genre = self unless song.genre == self
#        @songs << song unless @songs.include?(song)
#        @genres << genre unless @genres.include?(genre)
     end
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

#    def song=(song)  #assigns songs to artist
#       @song = song
#      # song.add_artist(self)
#     end

    def add_song(song)
       @song = song
       song.artist = self unless song.artist == self
       @songs << song unless @songs.include?(song)
    end


    def self.create(name, song=nil, genre=nil)
      new(name, song=nil, genre=nil).tap {|artist| artist.save}
#         self.new
#         self.save
    end



    def self.destroy_all
        @@all = []
    end
end
