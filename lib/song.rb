require "pry"

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    unless genre.nil?
      self.genre=(genre)
    end

    unless artist.nil?
      self.artist=(artist)
    end
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
      new = Song.new(name)
      @@all << new
      new
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre

    unless self.genre.songs.include?(self)
      self.genre.songs << self
    end
  end

  def self.new_from_filename(file_name)
     artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
     genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].chomp(".mp3"))
     song = Song.new(file_name.split(" - ")[1], artist, genre)
     song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

end

# rspec spec/001_song_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb
# rspec spec/005_songs_and_genres_spec.rb
# rspec spec/007_findable_songs_spec.rb
# rspec spec/008_findable_module_spec.rb
