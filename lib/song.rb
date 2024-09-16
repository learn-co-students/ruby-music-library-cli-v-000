class Song
  attr_accessor :name
  attr_reader :genre, :artist
  extend Concerns::Findable
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
    created_song = self.new(name)
    created_song.save
    created_song
  end
  
  def self.new_from_filename(filename)
    art, songname, gen = filename.chomp(".mp3").split(" - ")
    song = find_or_create_by_name(songname)
    song.artist=(Artist.find_or_create_by_name(art))
    song.genre=(Genre.find_or_create_by_name(gen))
    song
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
  end
  
end