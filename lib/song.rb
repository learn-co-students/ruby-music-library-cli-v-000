require 'pry'

class Song

  #extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist="", genre="")
    @name = name
    artist == "" ? nil : self.artist = artist
    genre == "" ? nil : self.genre = genre
    self
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    # binding.pry
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.songs.include?(self) ? nil : artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? nil : genre.add_song(self)
  end

  def self.destroy_all
    @@all = []
  end

  def self.find_by_name(name)
    @@all.select{|song| song.name == name}[0]
  end

  def self.find_or_create_by_name(name)
    song_exists = @@all.select{|song| song.name = name}[0] #loop through @@all looking for the song and return the first match
    song_exists == nil ? self.create(name) : song_exists #if the array is empty, create the song. otherwise, return the existing song
  end

  def self.new_from_filename(filename)
    song = Song.create(filename.split(" - ")[1])
    new_artist = Artist.find_or_create_by_name((filename.split(" - ")[0]))
    puts "new_artist = #{new_artist.name}"
    song.artist=new_artist
    temp_genre = filename.split(" - ")[2]
    temp_genre.slice! ".mp3"
    new_genre = Genre.find_or_create_by_name(temp_genre)
    song.genre=new_genre
    #song.artist=(filename.split(" - ")[0])
    #binding.pry
    song
  end

  def self.create_from_filename(filename)
    song_name = filename.split(" - ")[1]
    song_exists = @@all.select{|song| song.name == song_name}[0]
    #binding.pry
    song = nil
    if song_exists == nil then
      puts "Creating #{song_name}"
      new_song = Song.new_from_filename(filename)
      #new_song.save - song already saved by Song.create called from Song.new_from_filename
      song = new_song
    else
      puts "Song already exists."
    end
    song
  end

end
