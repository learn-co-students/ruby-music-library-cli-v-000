require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

# <<<<<<< HEAD
  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist != nil ? self.artist= artist : nil
    genre != nil ? self.genre= genre : nil
# =======
  # def initialize(name, artist="", genre="")
  #   @name = name
  #   self.artist = artist
  #   self.genre = genre
# >>>>>>> b95c934c51cc6b7f64f374b896b04e649fc44df3
    save
  end

  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create(name) : find_by_name(name)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = self.new(name)
  end

  def artist=(artist)
    @artist = artist
# <<<<<<< HEAD
    artist.add_song(self)

# =======
    # binding.pry

#     if artist.is_a?(String) == true
#       artist = Artist.new(artist)
#       # self.artist = artist
#       # artist.add_song(self)
#     elsif
#       artist.add_song(self)
#     end
# >>>>>>> b95c934c51cc6b7f64f374b896b04e649fc44df3
  end

  def genre=(genre)
    @genre = genre
    if genre == ""
      genre = Genre.new(genre)
      genre.songs << self
    else
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def self.new_from_filename(filename)
    file_song = filename.split(" - ")[1]
    file_artist = filename.split(" - ")[0]
    file_genre = filename.split(" - ")[2].gsub(".mp3", "")

# <<<<<<< HEAD
    a = Artist.find_or_create_by_name(file_artist)
    g = Genre.find_or_create_by_name(file_genre)

    song = Song.new(file_song, a, g)
# =======
#     song = Song.new(file_song, file_artist)
# >>>>>>> b95c934c51cc6b7f64f374b896b04e649fc44df3
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
