require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  # attr_reader :artist
  @@all = []

  def initialize(name, artist=nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    @@all << song.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    binding.pry
    self.all.detect {|k| k.name.include?(name)}
  end

  def self.find_or_create_by_name(name, artist = nil, genre = nil)
    if self.all.detect {|k| k.name == name}
      self.all.detect {|k| k.name == name}
    else
      song = self.new(name, artist = nil, genre = nil)
      self.all << song
      song
    end
    # song
  end

  def self.new_from_filename(file_name)
    song = self.new((file_name.split("-")[1].strip),Artist.find_or_create_by_name(file_name.split("-")[0].strip),Genre.find_or_create_by_name(file_name.split("-")[2].split(".")[0].strip))
  end

  def self.create_from_filename(file_name)
    song = self.new((file_name.split("-")[1].strip),Artist.find_or_create_by_name(file_name.split("-")[0].strip),Genre.find_or_create_by_name(file_name.split("-")[2].split(".")[0].strip))
    song.save
  end

#Song.find_by_name("For Love I Come")

end

# 1) Making Songs from filenames Song.new_from_filename initializes a song based on the filename delimiters
#      Failure/Error: expect(song.name).to eq("For Love I Come")
#
#        expected: "For Love I Come"
#             got: "dance"
#
#        (compared using ==)
#      # ./spec/010_music_importer_spec.rb:38:in `block (3 levels) in <top (required)>'
