class Song

extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all.push(self)
  end

  def artist= artist
    @artist = artist
    artist.add_song(self)
  end


  def genre= genre
    @genre = genre
    genre.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end


 def self.new_from_filename(filename)
  items = filename.split(" - ")
  artist = Artist.find_or_create_by_name(items[0])
  name = items[1]
  genre_name =  items[2].gsub(".mp3","")
  genre = Genre.find_or_create_by_name(genre_name)
  song_name = self.new(name, artist, genre)
  song_name
 end

 def self.create_from_filename(filename)
   new = self.new_from_filename(filename)
   new.save
   new
 end


end
