class Song

attr_accessor :name
attr_reader :artist, :genre #prevent us changing the artist name again once it's set up on initialization


@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre= genre if genre
    self.artist= artist if artist #you take away the @ so you must invoke artist= method below, forces us to make the associations in artist= method on initialization. if you just run artist= that is a method, it needs a receiver(self)
    #@@all << self you must delete this line because you are using #save method now. There is no test for this
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end


  #Test: artist= method should invoke Artist#add_song to add the song instance to the artist's collection of songs (artist has many songs)
  #this is to add the artist name to the song at the same time that the artist name is created
  def artist= (artist) #custom setter method for the artist attribute in the Song Class (you are passing in an artist object - see let artist: in Spec
    @artist = artist  #setting artist attribute to the artist object passed in for the Song Class
    artist.add_song(self) #invokes the add_song method on the artist object (now assigned to the @artist variable) and associates to the artist attribute
    #if you just tried add_song(self) it errors say undefined method for the Song object - doesn't have a method called add_song in this class
    #if you tried Artist.add_song(self) the errors saying underfine method for Artist class (add_song is not an Class method)
    #you must direct it to use artist.add_song(self) because you are using the instance method from the artist class.
    #why does @artist.add_song(self) also work? Because the values of @artist from the song class is the same
  end

  def genre= (genre)
    @genre = genre #assigns a genre to the song (whatever is passed in the genre object called genre (indie rock))
    genre.songs << self unless genre.songs.include? self #pushes this song into the indie rock @songs instance which is an array unless it already exists
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
  end



end
