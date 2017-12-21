class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)

    @name = name
    @artist = artist
    @genre = genre

    if artist != nil
      self.artist=(artist) #artist= method not working
    else
      nil
    end

    if genre != nil
      self.genre=(genre)
    else
      nil
    end
    @artist
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

  def artist=(artist) # this must not be producing an artist instance
    if self.artist == artist
      ##****  artist.add_song(self) ## error artist as string not object [add_song can't be called on a string]
    else
        # this must not be producing an artist instance
      artist.add_song(self) ## error artist as string not object (I think the error is on this line)
    end
  end

  def genre=(genre)
    if self.genre == genre
      genre.add_song(self)
    else
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    #returns (does not recreate) an existing song with the provided name if one exists in @@all
    if song = self.find_by_name(name)
      song
    else
      Song.create(name)
    end
  end

#####****

  def self.new_from_filename(filename) # filename = "Adele - Someone Like You - country.mp3"
    song_array = filename.split(" - ").collect{|element| element.gsub(".mp3", "")}
      #=> ["Adele", "Someone Like You", "country"]
    song_instance = Song.find_or_create_by_name(song_array[1]) #needs to create an instance of a song - YES
      #=>#<Song:0x000000016e5f18 @name="Someone Like You">
    song_instance.artist = song_array[0] #ERROR: undefined method `add_song' for "Adele":String/song.rb:48:in `artist='

  end

#####****


  #def self.new_from_filename(filename)
  #end




  #binding.pry


end
