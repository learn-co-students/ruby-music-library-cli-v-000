class Song
  #=> THere are three names for the "extend" crap below:
  # Builder Pattern
  # Mixing Pattern
  # Module Pattern
#  extend Findable # take all of the methods in the findable module and add them as class [extend] methods.
  extend Concerns::Findable #=> This is the module this lab's tests are looking for
  extend Persistable::ClassMethods
#  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :genre, :artist
# @@all = [] #=> we're able to get rid of this with the <<def self.extended(base)>> method in persistable.rb
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    artist=(artist)      #=> invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    # self.artist=(artist) doesn't work
#   self.artist = artist if artist #=> this works...watch the video to find out why
    self.artist = artist if artist != nil # this is basically another way to write the code above...I think the test was entering nil causing many errors.

    @genre = genre
    genre=(genre)
    self.genre = genre if genre != nil

  end

  def genre=(genre)
    # a reciprocal belongs to
    # First be a nice object and tell the genre that it has a new song...me!
    genre.songs << self unless genre.songs.include?(self)
    # Next, assign that genre to myself
    @genre = genre
  end
# this is going into the persistable.rb file
# def save
#   @@all << self
# end

  def self.create(name)
    s = new(name) #=> This is a bizzaro thingy wherein this line of code is activating the "initalize" method above.
    s.save
    s
  end

  def self.all # This is s.thing special called a "Class Reader"
    @@all
  end

# this is going into the persistable.rb file
#  def self.destroy_all
#    @@all.clear
#  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self) #=> invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
  end



# watch this video here again: https://www.youtube.com/watch?v=J_BSGPW37AE
# figure out how to use "pry" - but figure it out really really well, not half-ass.
# figure out how to follow the order of happenings in order to debug this shit
# open up a new repl.it screen and use that to see the return values you are getting...
# figure out how to use pry to SEE WHAT RETURN VALUES YOU'RE GETTING AT SPECIFIC POINTS IN TIME

  def self.find_or_create_by_name(newsong) #=> returns (does not recreate) an existing song with the provided name if one exists in @@all (FAILED - 1)
#    binding.pry
    if find_by_name(newsong) != nil #the value of the instance for which I only have a name.
      self.all.detect {|x| x.name == newsong}
    else
      self.create(newsong)
    end
  end

  def self.new_from_filename(filename)
    # the problem is that a = Song.new("Lala", "John", "rap") is broken so this method will brake
    # I still don't inderstand how the Song class is letting the Artist class know of the new artist "John"
        #=> does it have something to do with <<artist=(artist)>> on line 16 above?
    # Figure out how Song & Artist are collaborating
    # Figure out how line 16 actually works.
    # Line 54 <<artist.add_song(self)>> is not working; the "artist" doesn't seem to know it's an incidence of "Artist"
    # Make a song, artist, and genre class in repl it with basic level collaboration andn @name=(name) methods n/ sheat

    # at this point in the code, lines 15 & 16 above don't trigger any rspec tests to fail
    cut = filename.split(" - ")
    song_artist_name = cut[0]
    song_name = cut[1].gsub(/^\s/, "")
    song_genre_name = cut[2].gsub(".mp3", "")
    # somehow here we need to inform the program that <<song_artist_name>> is an incidence of Artist

#    These two lines generate the same number of errors, but error messages differ

     x = Artist.find_or_create_by_name(song_artist_name)
     y = Genre.find_or_create_by_name(song_genre_name)

     self.new(song_name, x, y)


#    self.new(song_name, song_artist_name, song_genre_name)
  end

  def self.create_from_filename(filename) #=> filename = "Thundercat - For Love I Come - dance.mp3" in the rspec test.
    x = self.new_from_filename(filename)
    x.save
  end
end
