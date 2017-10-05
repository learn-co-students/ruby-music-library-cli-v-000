class Song
  attr_accessor :name                                #retrieves the name of a song, can set the name of a song
  attr_reader :artist, :genre
  @@all = []                                         #class variable all is initialized as an empty array to store all Song instances
  def initialize(name, artist= nil, genre= nil)      #accepts a name for the new song, optional artist argument set to nil as default
    @name = name
    #@artist = artist                         #artist can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property
    self.artist= artist unless artist.nil?    #invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    @genre = genre                            #invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property
    self.genre= genre if genre                #invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization
  end

  def self.all                          #returns the class variable @@all
    @@all
  end

  def self.destroy_all                  #resets the @@all class variable to an empty array
    @@all.clear
  end

  def save                              #adds the Song instance to the @@all class variable
    @@all << self
  end

  def self.create(song_name)            #Song.create initializes and saves the song instance to @@all
      song = Song.new(song_name)
      song.save
      song
  end

  def artist=(artist)                   #custom setter method invokes Artist#add_song to add itself to the artist's collection of songs
    @artist = artist
    artist.add_song(self)               #and sets the song's artist proerty vs. native attr_accessor method :artist
  end

  def genre=(genre)                                              #custom setter method adds the song to the genre's collection of songs
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)        #and assigns a genre to the song unless the song is already in classified in the genre collection
  end

  def self.find_by_name(instance_name)                #class method finds a song instance in class variable @@all by the name property of the song
    self.all.detect {|song| song.name == instance_name}
  end

  def self.find_or_create_by_name(instance_name)      #class method returns (does not recreate) an existing song with the provided name if one exists in @@all
     find_by_name(instance_name) || self.create(instance_name)
  end

  # def self.find_or_create_by_name(name)   #class method uses find/create class
  #   if find_by_name(name).nil?            #methods to detect or create instances
  #     create(name)
  #   else
  #     find_by_name(name)
  #   end
  # end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = Song.new(file[1])                              #initializes a song based on the passed-in filename
    song.artist = Artist.find_or_create_by_name(file[0])  #invokes the appropriate Findable methods so as to avoid duplicating objects
    song.genre = Genre.find_or_create_by_name(file[2])    #invokes the appropriate Findable methods so as to avoid duplicating objects
    song.save
    song
  end

  def self.create_from_filename(filename)               #initializes and saves a song based on the passed-in filename
    new_from_filename(filename)                         #invokes new_from_filename instead of re-coding the same functionality
  end
end
