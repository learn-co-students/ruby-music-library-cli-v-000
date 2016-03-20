class Artist
   extend Concerns::Findable

  attr_accessor :name, :songs #, :song,:genre, :genres,
  @@all = []

    def initialize(name, song=nil, genre=nil)
        @name = name
        @songs = []
      #  @genres = []
    end

#     def genre
#       @genre = genre
#        self.songs.collect do |song|
#          song.genre #.artist #= self
#        end
#     end
#      #       song.genre
    def genres
      self.songs.collect{ |song| song.genre}.uniq
       #self.songs.collect do |song|   #something is wrong w this block. Artist-genre issues gone w line above
         # song.genre
      #end

     #       song.genre.uniq #.uniq  #comment out uniq
#             @genres << song.genre #.uniq
           # @songs << song.genre

        #

    end

#     def genres
#        @genres
#     end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def add_song(song)
       @song = song
       song.artist = self unless song.artist == self
      # song.artist = self unless song.artist == self
       @songs << song unless @songs.include?(song)
    end

    def self.create(name, song=nil, genre=nil)
      new(name, song=nil, genre=nil).tap {|artist| artist.save}
    end

    def self.destroy_all
        @@all = []
    end
end
