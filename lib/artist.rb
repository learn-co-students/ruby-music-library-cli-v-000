require_relative '../concerns/findable'
require 'pry'
#extend Concerns::Findable
#extend Concerns::MaintainableClass
#include Concerns::MaintainableInstance

class Artist
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist # if I don't return artist here, or if I don't return self in self.create, one test doesn't pass. this is because it return the entire array, which may include dups. May be able to remove this after we're checking for dups later in testing. we may be able to only send the single instance from create to save, which would make more sense, i think.
  end

  def self.find_by_name(artist_instance)
    self.all.find {|artist| artist.name = artist_instance}
  end

  def self.create_by_name(artist_instance)
    Artist.new(artist_instance)
  end

  def self.find_or_create_by_name(artist_name)
    find_by_name(artist_name).nil? ? create_by_name(artist_name) : find_by_name(artist_name)

    #the_artist = find_by_name(artist_instance)
    #if the_artist == nil?
    #  the_artist = Artist.new(artist_instance)
    #end
    # the_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song_instance)
    if !songs.include?(song_instance) #we may need to check for the artist to be assigned instead of for the song instance itself
      @songs << song_instance
      song_instance.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end



  def save
    self.class.all << self
    #self # if I don't either return self here, or return artist in self.create, one test doesn't pass. because this would return teh entire array. instead of the one instance we're saving.
  end


end