class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = [] #or self.all.clear
  end

  def self.create(name) #custom constructor. Allows creation of object from another environment
    artist = Artist.new(name)
    artist.save
    artist
  end


  def add_song(song)
      ##assigns the current artist to the song's "artist" property (song belongs to (artist)
    if song.artist == nil
      song.artist = self
    end
    @songs << song unless @songs.include?(song)#.include checks if song in array. Adds song if not in array
  end

##artist has many genres through songs
##tried some variations none worked. Why are we not using it's own instance variable? How are genres being stored?
#How do I think of this in larger top down scheme in how things relate?
  def genres#(genre = nil)
    #if songs.uniq.length == songs.length // #Songs.indlude?
      #if @genre.include?(genre)
      genres = songs.collect do |song| #collects genres through its songs instead of maintaining its own @genres instance variable
      song.genre#returns a collection of genres for all of the artist's songs
    end
    genres.uniq #checks for duplicates
  end

end
