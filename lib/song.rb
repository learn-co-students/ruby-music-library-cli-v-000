require_relative '../concerns/findable'
require_relative 'artist'
require 'pry'
#extend Concerns::Findable
#extend Concerns::MaintainableClass
#include Concerns::MaintainableInstance

class Song
  @@all = []
  attr_accessor :name, :genre
  attr_reader :artist

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    #binding.pry
    if artist
      puts "#{artist} called the if artist statement in init"
      self.artist=(artist)
      #binding.pry
    end
  end

  def artist=(artist)
    puts "the if artist statement in init just sent #{artist} to the artist= method"
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
    #binding.pry
  end

  def self.create(name)
    puts "<===== Song  #{__callee__} =====>"
    new_song = self.new(name)
    new_song.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    puts "<===== song  #{__callee__} =====>"
    self.class.all << self # this returns the entire array of @@all
    self # so this is needed to get last test in 001 to pass. this is because it return the entire array, which may include dups. May be able to remove this after we're checking for dups later in testing. or we may be able to only send the single instance from create to save, which would make more sense, i think.
  end

end

###### start test data for song spec 001 #######
#
# song = Song.new("In an Aeroplane Over the Sea")
# song.name = "Jump Around"
# p song
# p Song.all
# Song.destroy_all
# p Song.all
# song2 = Song.new("In a plane Over the Sea")
# song2.save
# p "Song.all after saving song2: #{Song.all}"
# song3 = Song.create("In a glider Over the Sea")
# p "Song.all after saving song3: #{Song.all}"
#
###### end test data for song spec 001 #######

###### start test data for spec 004 #######
# p Song.all
# emartist = Artist.new('eminem')
# song4 = Song.new('Lose Yourself', emartist)
# puts  "emartist.songs = #{emartist.songs}\n\n"
# puts "song4.artist = #{song4.artist.name}\n\n"
# puts "Song.all includes: #{Song.all}\n\n"
###### end test data for spec 004 #######
