class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    # invokes #artist= instead of simply assigning to an @artist instance
      # variable to ensure that associations are created upon initialization
    @name = name
    @artist = artist
    @genre = genre

    if @artist == nil
      nil
    else
      self.artist=(artist)
    end

    if @genre == nil
      nil
    else
      self.genre = genre
    end

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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist) # needs to be instance of Artist, but passing a string
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre) # needs to be instance of Genre, but passing a string
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  #returns (does not recreate) an existing song with the provided name if one exists in @@all
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      Song.create(name)
    end
  end


  def self.new_from_filename(filename) # filename = "Adele - Someone Like You - country.mp3"

    song_array = filename.split(" - ").collect{|element| element.gsub(".mp3", "")}
      #=> ["Adele", "Someone Like You", "country"]
    song_instance = self.find_or_create_by_name(song_array[1]) #needs to create an instance of a song - YES
      #=>#<Song:0x000000016e5f18 @name="Someone Like You">
    song_instance.artist = song_array[0] #ERROR: undefined method `add_song' for "Adele":String/song.rb:48:in `artist='

  end




  #def self.new_from_filename(filename)
  #end




  #binding.pry


end
