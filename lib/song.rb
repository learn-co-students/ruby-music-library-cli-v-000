require 'pry'

class Song
  attr_accessor :name, :artist, :genre
    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

    # @@all array: methods to save,
    # read & delete list of all Song objects
  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end
    # end @@all methods

  def self.find_by_name(name)
    self.all.find {|song| song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    # 3 filename parts array: artist, song name, genre.mp3
    parts = (filename.split(" - ")
    song = self.new(parts[1])
    song.artist = Artist.find_or_create_by_name(parts[0])
    song.genre = Genre.find_or_create_by_name(parts[2].gsub(".mp3",""))
    song
  end

#  def self.create_from_filename(filename)

# Rspec:
# describe ".new_from_filename" do
#  it "initializes a song based on the passed-in filename" do
#    song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

  def self.new_from_filename(filename)
    song = self.new(filename.split(" - ")[1])
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3",""))
    song
  end



#  def self.create_from_filename(filename)



#    song = self.new_from_filename(filename)
#  end

end # Song class end
