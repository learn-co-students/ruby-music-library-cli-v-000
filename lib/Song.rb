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

  def save
    self.class.all << self
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
