class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all= []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist !=nil
      self.artist = artist
    end
    if genre !=nil
      self.genre = genre
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    new_song = self.new(filename.split(" - ")[1])
    new_song.artist =  Artist.find_or_create_by_name(filename.split(" - ")[0])
    new_song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
  end

  def save
    if !self.class.all.include?(self)
      self.class.all << self
    end
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

end
