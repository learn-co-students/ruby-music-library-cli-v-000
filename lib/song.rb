class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    # invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

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
    song_instance = self.find_or_create_by_name(song_array[1])
              #=>#<Song:0x000000016e5f18 @name="Someone Like You" @genre="country">
    new_artist_instance = Artist.find_or_create_by_name(song_array[0])
    song_instance.artist = new_artist_instance
    new_genre_instance = Genre.find_or_create_by_name(song_array[2])
    song_instance.genre = new_genre_instance
    song_instance
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
