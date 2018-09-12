class Song

attr_accessor :name
attr_reader :artist, :genre

@@all = []

  def initialize(title, artist = nil)  # Tip: A commonly used default value for optional parameters is nil
    @name= title
    @artist = artist
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

  def self.create(title)
    song = Song.new(title)
    song.save
    song
  end

  def artist=(artist) #setter for artist
    @artist = artist
    artist.add_song(self) #assigns an artist to the song (song belongs to artist)
  end

end
