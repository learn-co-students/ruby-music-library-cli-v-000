# The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
require 'pry'
class Song

  extend Concerns::Findable

  # each songs belongs to relationship
  attr_accessor :name, :artist, :genre, :artist_name, :genre_name

  @@all = []

  def initialize(name, artist= Artist.new(artist_name), genre= Genre.new(genre_name))
    @name = name
    #if artist exists, then make self.artist
    #self.artist = artist if artist
    #self.genre = genre if genre
    unless artist.nil?
      self.artist=(artist)
    end

    unless genre.nil?
      self.genre=(genre)
    end
  end

  # assigns an artist to the song (song belongs to artist)
  #invokes Artist#add_song to add itself to the artist's collection of songs
    #(artist has many songs)
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def genre
    @genre
  end

  def self.all # Class reader
    @@all
  end

  def self.destroy_all #@@all.clear??
    @@all = []
  end

  def save
    @@all << self
  end

  def self.new_from_filename(filename)
    filename.chomp!(".mp3")
    #self.name = find_by_name(filename.split(" - ")[1])
    @artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    @genre = Genre.find_or_create_by_name(filename.split(" - ")[2])

    self.new(filename.split(" - ")[1], @artist, @genre)
  end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end

=begin
   def self.create(name)
     new_song = Song.new(name)
     new_song.save
     new_song
   end

   def self.find_by_name(name)
     @@all.find{|o| o.name == name}
   end

   def self.find_or_create_by_name(name)
     #binding.pry
     if self.find_by_name(name) != nil
       self.find_by_name(name)
    else
      self.create(name)
    end
   end
=end
end
