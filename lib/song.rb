class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    # if artist
    #   self.artist = artist
    # end
    ####BETTER WRITTEN AS \/
    self.artist = artist unless artist.nil?

    self.genre = genre unless genre.nil?

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre

    # if !genre.songs.include?(self)
    #   genre.songs << self
    # end
    ###BETTER WRITTEN AS \/

    genre.songs << self unless genre.songs.include?(self)

  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    created_song = Song.new(name).tap do |c_s| #<---using the TAP method removes the need to end this method with repetitive returns
      c_s.save
    end
  end

  def self.find_by_name(song_string)
    song_found = self.all.detect { |song_object| song_object.name == song_string }
    # DETECTmethod returns NIL if no matching data is found - eliminating the need for an explicit flag
  end

  def self.find_or_create_by_name(song_string)
    found = self.find_by_name(song_string)
    found != nil ? found : self.create(song_string)
    # if the FOUND placeholder does not have NIL as its value, return the FOUND song, otherwise call the CREATE method
  end

  def self.new_from_filename(filename)
    # parse the filename into 3 parts - [0]artist - [1]song name - [2]genre - which are put into an array and can be accessed
    file_split = filename.split(/ - /)
    self.artist = file_split[0]
    self.name = file_split[1] # AKA the song name
    # remove the .MP3 part of the string, & assign it to the GENRE attribute
    self.genre = file_split[2].sub(/\.mp3/, "")
  end

  def self.create_from_filename(filename)

  end


end
