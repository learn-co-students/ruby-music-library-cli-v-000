require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    #invokes #artist=/genre= instead of simply assigning to an @artist/genre instance variable to ensure that associations are created upon initialization; check if artist/genre is nil b/c can't .add_song to nil
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    @genre.add_song(self)
  end

  def self.new_from_filename(file)  #ex: "Thundercat - For Love I Come - dance.mp3"
    parse = file.split(" - ")
    file_artist = parse[0]
    file_song = parse[1]
    file_genre = parse[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(file_artist) #run these first to make sure it doesn't exist already
    genre = Genre.find_or_create_by_name(file_genre)
    self.new(file_song, artist, genre) #then init new song from the existing/created artist/genre
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

end
