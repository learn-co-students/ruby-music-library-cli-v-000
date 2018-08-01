class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
     @name = name
     self.artist= artist if artist != nil
     self.genre= genre if genre != nil
   end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
    song.name == song_name
      end
  end

  def self.find_or_create_by_name(song_name)
      find_by_name(song_name) || create(song_name)
    end

end
