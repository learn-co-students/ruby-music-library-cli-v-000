class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist if artist #initialize -   invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are
    #created upon initialization
    self.genre = genre if genre #invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist) #artist=invokes Artist add_song to add itself to the artist's collection of songs (artist has many songs)
    @artist = artist
    artist.add_song(self)
  end


  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
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

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2])
    song.save
    song
  end

   def self.create_from_filename(filename)
     song = self.new_from_filename(filename)
     song.save
     #initializes and saves a song based on the passed-in filename
     #invokes .new_from_filename instead of re-coding the same functionality
   end


end
