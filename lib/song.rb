require_relative '../concerns/findable'
require_relative 'artist'
require 'pry'
#extend Concerns::Findable
#extend Concerns::MaintainableClass
#include Concerns::MaintainableInstance

class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre)
    genre.add_song(self) unless genre.songs.include?(self)
    @genre = genre
  end

  def save
    self.class.all << self # this returns the entire array of @@all
     # so this is needed to get last test in 001 to pass. this is because it return the entire array, which may include dups. May be able to remove this after we're checking for dups later in testing. or we may be able to only send the single instance from create to save, which would make more sense, i think.
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.find { |obj| obj.name == name }
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    found ? found : self.new(name)

    #find_by_name(name) ?  self.new(name) : find_by_name(name)
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

###### start test data for spec 007 #######
# song = Song.new("In an Aeroplane Over the Sea")
# song.save
# binding.pry
# Song.find_by_name("In an Aeroplane Over the Sea")
# song_1 = Song.find_or_create_by_name("In an Aeroplane Over the Sea")
# song_2 = Song.find_or_create_by_name("In an Aeroplane Over the Sea")

###### end test data for spec 007 #######