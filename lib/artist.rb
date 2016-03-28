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

    def genres
      self.songs.collect{ |song| song.genre}.uniq
       #self.songs.collect do |song|   #something is wrong w this block. Artist-genre issues gone w line above
         # song.genre
    end


    def save
        @@all << self   #can't be 'self.all' because 'self' is an instance
    end

    def add_song(song)
       @song = song
       song.artist = self unless song.artist == self
       @songs << song unless @songs.include?(song)
    end

    def self.create(name) #, song=nil, genre=nil
      new(name).tap {|artist| artist.save}   #, song=nil, genre=nil
    end

#     def self.find_by_name(name)

#     end



    def self.destroy_all
        #@@all = []
       self.all.clear # @@all.clear
    end
end
