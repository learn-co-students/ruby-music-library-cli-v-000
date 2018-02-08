require 'pry'
class Genre
  extend Concerns::Findable
attr_accessor :name, :songs
   @@all = []

   #peter = Genre.new("peter")  How we create a new Genre.
    #<Genre:0x00000000ce4cd0 @name="peter", @songs=[]>
    def initialize(name)
      @name = name
        # if artist !nil
        # self.song
        @songs = [ ]

       #peter.song = ("pit")  How to attribute song to the Genre after the Genre is create.
    # end
  end

    def genre
      @genre
    end

    def save
      @@all << self  # refers to the class Genre to save the songs when created
    end

    def self.all # show all song Genre ever created.
      @@all
    end



    def self.destroy_all
          @@all.clear
    end

    def self.create(name)
         genre = Genre.new(name)
         genre.save
         genre
    end


    def artists
        @songs.collect do |song|
       song.artist # one song has one artist
    end
   end

   def add_song(song)
    @songs << song unless @songs.include?(song)  #unless song included in our collection.x
    song.genre = self if song.genre != self
   end

   def artists
       # @songs.collect do |song|
       @songs.collect{ |song| song.artist}.uniq
       #song.genre # artist has many genre through songs.
   end

   def self.find_by_name(name)
        self.all.find {|x| x.name == name}
    end

    def self.find_or_create_by_name(name)
      #turn class string into an objects
      # This is where we chain things togther
       if self.find_by_name(name)
          self.find_by_name(name)
       else
         self.create(name)
       end
     end
  end
