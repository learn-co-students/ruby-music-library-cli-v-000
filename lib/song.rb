#  rspec spec/009_music_importer_spec.rb



class Song

  #genre attr_accessor is unique
  attr_accessor :name, :artist, :genre #setter and getter instance methods
  @@all = []   #an array to keep track of all created instances of Song class

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    @@all << self

    #if there is an artist argument, use that in the self.artist
    self.artist= artist if artist  #method artist= is previously defined
    self.genre= genre   if genre
  end

  #class method to display all instances created under Class
  def self.all
    @@all
  end
  #delete all saved instances of an array
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  #lets initialize a new song as a variable, and then set that variable to save in the array, (make sure you return the new instance object)
  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song
  end

#create method that sets a artist to a song, 1st set the artist attribute
#then call the add_song method (defined in artist class) on artist with self (song instance) as an argument
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  #give the song a genre, and if the song isnt already assigned to a genre add it to the genre class song array
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  #find_by_name method
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

# parse this ("Real Estate - It's Real - hip-hop.mp3")
  def self.new_from_filename(filename)
      #take the file name and split it into an array, the array posistion [1] to song
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name =  filename.split(" - ")[2].gsub(".mp3", "")
    song = self.find_or_create_by_name(song_name)
    #below we are setting the artist attribute for the new song we are creating
    song.artist = Artist.find_or_create_by_name(artist_name)
    #do the same for genre to set attribute for new song
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
    #TIP  whenever using .new / .create / .find  you want to return an instance
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end

#  rspec spec/010_music_library_controller_spec.rb
# song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
