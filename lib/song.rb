class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
    

  @@all = []

#////////// CLASS METHODS //////////

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
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
    new_obj = self.new(name)
    new_obj.save
    new_obj
  end

  def self.new_from_filename(filename)
    filename = filename.chomp(".mp3").split(" - ")
    
    new_song = self.new(filename[1])
    new_song.artist = Artist.find_or_create_by_name(filename[0])
    new_song.genre = Genre.find_or_create_by_name(filename[2])

    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save.first
  end

#////////// INSTANCE METHODS //////////

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

end # <--end class -->