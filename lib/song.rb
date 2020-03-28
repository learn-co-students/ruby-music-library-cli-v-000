# song.rb

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre#, :artist
  attr_reader :artist
  @@all = [] # @@all initialized as an empty array

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  # return the class variable @@all
  def self.all
    @@all
  end

  # .destroy_all resets the @@all class variable to an empty array
  def self.destroy_all
    self.all.clear
  end

  #save adds the Song instance to the @@all class variable
  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

# Song.new_from_filename method initializes a song based on the passed-in filename
  def self.new_from_filename(filename)
    song_data = filename.chomp('.mp3').split(" - ")
    @artist = Artist.find_or_create_by_name(song_data[0])
    @genre = Genre.find_or_create_by_name(song_data[2])
    @song = self.new(song_data[1], @artist, @genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    @song.save
  end

  def self.alpha_songs
        @@alpha_songs = @@all.sort {|a, b| a.name <=> b.name}  # sort list of songs alphabetically by song name
  end
end
