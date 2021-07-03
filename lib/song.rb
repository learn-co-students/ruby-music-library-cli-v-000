require 'pry'

class Song

attr_accessor :name

attr_reader :artist, :genre

  @@all=[]

  def initialize(name, artist=nil, genre=nil)
    @name=name
    #@artist=artist
    self.artist = artist if artist
    self.genre=genre if genre
    #@@all<<self
  end

  def artist=(artist)
    @artist=artist
    artist.add_song (self)
  end

  def genre=(genre)
    @genre=genre
    genre.songs<<self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all<<self
  end

  def self.create(name)
    song=new(name)
    song.save
    song
  end



  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end

  def self.new_from_filename(filename)

    ary = filename.split(" - ")
    artist_name, song_name, genre_name = ary[0], ary[1], ary[2].gsub(".mp3", "")

    #binding.pry

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)#<<<<< NoMethodError=: undefined method 'add_song' for "Thundercat":String***Solution***changed passed in arguments from artist_name, genre_name to 'artist' and 'genre'
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{ |s| s.save } #.tap yields self to the block, and then returns self. The primary purpose of this method is to “tap into” a method chain, in order to perform operations on intermediate results within the chain.
  end
end






  #def self.new_from_filename(filename)
    #parts = filename.split(" - ")
    #artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    #artist = Artist.find_or_create_by_name(artist_name)
    #genre = Genre.find_or_create_by_name(genre_name)

    #Song.new(song_name, artist=nil, genre=nil)
  #end

  #def self.new_from_filename(filename)
    #parts= filename.split("-")
    #artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
    #self.new(name, artist=nil, genre=nil)
    #new_song
    #artist_name=self.artist
    #song_name=new_song.name
    #genre_name=new_song.genre

    #artist, song = filename.split(" - ")
    #new_song = self.new(song)
    #new_song.artist_name = artist
    #new_song
  #end

    #song=Song.new(name, artist=nil, genre=nil)
    #splits=filename.split(" - ")
    #artist_name, song_name, genre_name = splits[0], splits[1], splits[2].gsub(".mp3", "")
    #parts = filename.split(" - ")
    #song_name=parts[1]
    #artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    #song=self.new(name, artist=nil, genre=nil)


   #Song.new.name = filename.split(" - ")[1]
   #song

  #def self.create_from_filename(filename)
    #new_from_filename(filename).tap{ |s| s.save }
  #end
