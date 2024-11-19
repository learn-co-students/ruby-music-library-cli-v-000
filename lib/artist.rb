require 'pry'

class Artist
  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    @name = self.new(name)
    self.all << @name
    @name
  end

  def self.destroy_all
    self.all.clear
  end

  def songs
    @songs
  end

  def add_song(song)

    if self.songs.detect {|saved_songs_instance| saved_songs_instance == song} == nil

      if song.class == String
        new_song_instance = Song.new(song)
        self.songs << song_instance
        @song = song_instance
      elsif song.class == Song
        self.songs << song
        @song = song
      end

      if @song.artist != self
         @song.artist = self
      end

    end
  end

  def genres
    genre_collection = self.songs.collect {|saved_song_instance| saved_song_instance.genre}
    genre_collection.uniq
  end

end
