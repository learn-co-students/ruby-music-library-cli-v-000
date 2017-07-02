require_relative '../concerns/music_module'
require 'pry'
class Artist<Music
  extend Concerns::Findable
  @@all_artists =[]
  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.create(name)
    new_item = Artist.new(name)
    self.all << new_item
    return new_item
  end

  def add_song(song)
    if self.songs.include?(song) == false
    self.songs<<song
        song.artist= self
    end
  end

  def songs
    @songs
  end

  def genres_notunique
    @songs.collect {|song| song.genre}
  end

  def genres
    self.genres_notunique.uniq
  end

  def save
    @@all_artists << self
  end

  def self.destroy_all
    @@all_artists=[]
  end

  def self.create(name)
    new(name).tap {|a| a.save}
  end

  def self.all
    @@all_artists
  end
  # def add_genre(genre)
  #   if self.genres.include?(genre) == false
  #     self.genres << genre
  #   end
  # end

end
