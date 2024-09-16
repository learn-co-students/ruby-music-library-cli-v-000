class Artist
#  extend Findable # take all of the methods in the findable module and add them as class [extend] methods.
  extend Concerns::Findable #=> This is the module this lab's tests are looking for
  extend Persistable::ClassMethods
#  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :song, :genre
# @@all = [] #=> we're able to get rid of this with the <<def self.extended(base)>> method in persistable.rb
  def initialize(name)
    @name = name
    @songs = []
  end

# this is going into the persistable.rb file
# def save
#   @@all << self
# end

  def self.create(name)
    a = new(name) #=> This is a bizzaro thingy wherein this line of code is activating the "initalize" method above.
    a.save
    a
  end

  def self.all # This is s.thing special called a "Class Reader"
    @@all
  end

# this is going into the persistable.rb file
#  def self.destroy_all
#    @@all.clear
#  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self            #=> Artist; #add_song...assigns the current artist to the song's 'artist' property (song belongs to artist)
    end
    if !(self.songs.include?(song)) #=> Artist; #add_song...does not add the song to the current artist's collection of songs if it already exists therein
      @songs << song
    end
  end

  def genres
  # we need to find all of the songs for the artist (self.songs or @songs)
  # we need to iterate over thos songs and find the first unique example of each genre
  # we need to return those genres
    self.songs.map {|x| x.genre}.uniq
  end
end
