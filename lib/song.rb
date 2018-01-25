require'pry'
#rspec ./spec/006_artists_and_genres_spec.rb
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize (name, artist=nil, genre=nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
    #binding.pry
  end

  def artist= (artist_name)
    @artist = artist_name
    @artist.add_song(self)
  end

  def genre=(genre_name)
   @genre = genre_name
   @genre.songs<<self unless @genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.new_from_filename(filename)
    artist_name, title, genre_name_file = filename.split(" - ")
    song = Song.new(title)
    song.artist = Artist.find_or_create_by_name(artist_name)
    genre_name = genre_name_file.chomp(".mp3")
    song.genre = Genre.find_or_create_by_name(genre_name)
    song.artist.add_song(song)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|song| song.save}
  end

  def self.create(name)
    Song.new(name).tap{|song| song.save}
  end
end
