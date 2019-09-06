require'pry'
#rspec ./spec/006_artists_and_genres_spec.rb
class Song
  extend Concerns::Findable
  include Concerns::Saveable

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

  def self.new_from_filename(filename)
    artist_name, title, genre_name_file = filename.split(" - ")
    song = Song.new(title)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name_file.chomp".mp3")
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|song| song.save}
  end
end
