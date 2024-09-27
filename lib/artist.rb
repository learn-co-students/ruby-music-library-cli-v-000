require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    newb = self.new(name)
    @@all << newb
    newb
  end

  def self.all
    if @@all.uniq == @@all
      @@all
    else
      @@all.uniq!
    end
  end

  def self.print_all
    self.all.each {|i| puts "#{i.name}"}
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    @songs << song
    if song.artist != self
      song.artist = self
    end
  end

  def songs
    if @songs.uniq == @songs
      @songs
    else
      @songs.uniq!
    end
    return @songs
  end

  def add_songs(list)
    list.each { |song| self.add_song(song) }
  end

  def print_songs
    @songs.each {|i| puts i.name}
  end

  def genres
    array = @songs.collect {|song| song.genre} 
    if array.uniq == array
      array
    else
      array.uniq!
    end
    return array
  end

end
