class Song
  extend Findable::ClassMethods
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist #have to use if statement if the arg is optional
      self.artist = artist #have to use self because there is already a var named artist and you're calling a method outside of initialize
    end
    if genre
      self.genre = genre
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  #constructor that extends initialize, replaced the sandwich wrapper with the tap method, including the name argument
  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    filename.slice!('.mp3')
    name = filename.split(' - ')[1]
    artist_name = filename.split(' - ')[0]
    genre_name = filename.split(' - ')[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
