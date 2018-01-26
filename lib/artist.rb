require 'pry'

class Artist
  extend Concerns::Findable 
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song_obj)
    song_obj.artist = self unless song_obj.artist
    self.songs << song_obj unless self.songs.include?(song_obj)
  end

  def genres
    answer = []
    self.songs.each do |song_obj|
      answer << song_obj.genre unless answer.include?(song_obj.genre)
    end
    answer
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end


end
