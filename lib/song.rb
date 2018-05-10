require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist == nil
    else
      self.artist=(artist)
    end
    if genre == nil
    else
      self.genre=(genre)
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
    self.all
  end

  #song -artist
  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  #song-genre
  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
    else
      genre.songs << self
    end
  end

    #import filename/musicimporter
    def self.new_from_filename(filename)
      song = self.new(filename.split(" - ")[1])
      song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
      song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3",""))
      song
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
    end



end

#rspec spec/001_song_basics_spec.rb
#rspec spec/004_songs_and_artists_spec.rb
#rspec spec/005_songs_and_genres_spec.rb
#rspec spec/007_findable_songs_spec.rb
#rspec spec/008_findable_module_spec.rb
#learn spec/009_music_importer_spec.rb
