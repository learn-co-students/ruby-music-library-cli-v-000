require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, optional_artist = nil, optional_genre = nil)
    @name = name
    @artist = optional_artist
    if optional_artist
      self.artist.add_song(self)
    end
    @genre = optional_genre
    if optional_genre
      optional_genre.add_song(self) # add this song to the genre
    end
  end

##### Class Methods #####

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) if self.find_by_name(name) # if song is found, return it.
    self.create(name) # otherwise, create it
  end

  def self.new_from_filename(filename)
    parsed_data = filename.split(/ - |.mp3/)
    artist = Artist.find_or_create_by_name(parsed_data[0])
    song_name = parsed_data[1]
    genre = Genre.find_or_create_by_name(parsed_data[2])
    song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

##### End of Class Methods #####

##### Instance Methods #####

  def save  # Add this song (self) to the list of @@all songs
    self.class.all << self # **Returns @@all
    self  # return self (just in case it helps in another method)
  end

  def artist=(this_song_artist)
    if @artist != this_song_artist
      @artist = this_song_artist
    end
    if !this_song_artist.songs.include?(self)
      this_song_artist.add_song(self)
    end
  end

  # Genre setter
  def genre=(genre)
    @genre = genre if @genre == nil # Set genre if it isn't already set
    if !genre.songs.include?(self)  #  If the song isn't in the genre's list, add it.
      genre.add_song(self)
    end
  end
end
