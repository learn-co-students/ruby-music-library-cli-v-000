

class Artist
  extend Concerns::Findable

  @@artists = []

  attr_accessor :name, :songs, :genres

  def initialize (name)
    @name = name
    self.save
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def save
    @@artists << self unless @@artists.include?(self)
  end

 #HAS MANY

   def songs
     @songs
   end

   def add_song(song)
     if song.class != Song
       raise SongError
     else
       song.artist = self unless song.artist != nil
       @songs << song unless @songs.include?(song)
     end
   end

   def genres
     @songs.collect do |song|
       song.genre
     end.uniq
   end


   class SongError < StandardError
     def message
       "You must provide the add_song method an instance of the Song class"
     end
   end



end
