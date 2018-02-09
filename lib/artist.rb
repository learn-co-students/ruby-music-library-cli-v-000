class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist

  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    @artist = artist
    @genre = genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def songs #not tested yet
    @songs
  end

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end

  end

  def genres
    self.songs.collect {|x| x.genre}.uniq
    #@songs.collect {|x| x.genre}.uniq
  end
=begin
  def find_or_create_by_name(name)
    self.all.find {|x| x.name == name} || self.create(name)
    #or returns the first truthey value or the last falsey value. If the first doesnt exist(is falsey) it continues and executes the self.create
  end
=end
end
