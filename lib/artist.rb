class Artist #artist keeps a list of songs
extend Concerns::Findable

  attr_accessor :name, :songs #, :song,:genre, :genres,
  @@all = []

    def initialize(name, song=nil, genre=nil)
        @name = name
        @songs = []
    end

    def self.all
      @@all
    end


    def save
        @@all << self   #can't be 'self.all' because 'self' is an instance
    end

    def self.create(artist) #, song=nil, genre=nil
      # new(name).tap {|artist| artist.save}   #, song=nil, genre=nil
      artist = self.new(artist)
      @@all << artist
      artist
    end

    def add_song(song)
      #  @song = song
       song.artist = self unless song.artist == self
       @songs << song unless @songs.include?(song)
    end

    def genres
      @songs.collect{|song| song.genre}.uniq
      # self.songs.collect{ |song| song.genre}.uniq
       #self.songs.collect do |song|   #something is wrong w this block. Artist-genre issues gone w line above
         # song.genre
    end


    def to_s   #WHY? WHY IS THIS NECESSARY?
      self.name
    end


    def self.destroy_all
        #@@all = []
       @@all.clear
    end
end
