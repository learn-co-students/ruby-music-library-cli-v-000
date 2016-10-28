require "pry"
require_relative  "Song.rb"

class Artist
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @all = []
    @songs=[]
  end

  def self.all
  @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
end

 def add_song(song)
e  = self.songs.include?(song)
if e == false
  puts "adding to songs e is " + e.to_s
self.songs << song
end
if song.artist == nil
song.artist = self
end
end
end


song = Song.new("In the Aeroplane Over the Sea")
artist = Artist.new("Neutral Milk Hotel")
puts "calling first time"
puts artist.songs
puts "-----------------"
artist.add_song(song)

puts "calling second time"
puts artist.songs
puts "-----------------"
artist.add_song(song)

puts artist.songs
