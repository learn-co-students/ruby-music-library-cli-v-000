class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    @@all << song #song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) # calls on the instance method #add_song() located in Artist class and runs that code
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) # calls on the instance method #add_song() located in Genre class and runs that code
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name} # detect the first element in the @@all [] that is == to the argument being passed in
  end

  def self.find_or_create_by_name(name)
    # check condition, execute the class method that returns true with the argument being passed in
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ") # divides str into substrings based on a delimiter, returing an [] with substrings
    song_name = song[1] # assign the element at index[1] of the [] to song_name
    artist = Artist.find_or_create_by_name(song[0]) # assign the element at index[0] to new instance of Artist using the class method .find_or_create_by_name()
    genre = Genre.find_or_create_by_name(song[2].gsub(".mp3","")) # assign the element at index[2] to new instance of Genre using the class method .find_or_create_by_name(), replace "mp3" to "" using .gsub method
    self.new(song_name, artist, genre) # create a new instance of the Song class with the arguments being passed in
  end

  def self.create_from_filename(filename)
    song = filename.split(" - ")
    song_name = song[1]
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2].gsub(".mp3",""))
    self.create(song_name, artist, genre) # use the class method .create() to make an instance of the Song class, takes arguments
  end

end
