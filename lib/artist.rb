require "pry"

class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = Array.new
  end

  def save
    @@all << self
    @@all.last
  end

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    genres = []
    self.songs.each {|song| genres << song.genre}
    genres.uniq
  end

  def self.list_artists
    @@all.sort_by!{|artist| artist.name}
    i = 1
    @@all.each do |artist|
      puts("#{i}. #{artist.name}")
      i+=1
    end
  end

  def list_songs
    @songs.sort_by!{|song| song.name}
    i = 1
    @songs.each do |song|
      puts("#{i}. #{song.name} - #{song.genre.name}")
      i+=1
    end
  end
end
