require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name} #We're using the #detect method to return the first object from Person.all that satisfies the condition of its @name property equaling the name we are looking for.
  end

  def self.find_or_create_by_name(name)
    #binding.pry
    find_by_name(name) || create(name) #spec/007 did not pass until i added == name to line 47... why is that? ANSWER see comment above
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub(".mp3", "")

    genre = Genre.find_or_create_by_name(genre_name)
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.find_by_name(song_name)
      if song == nil 
        song = Song.new(song_name, artist, genre)
      end
    song 

    #new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    # binding.pry
    new_from_filename(filename).tap {|x| x.save}
  end

end
