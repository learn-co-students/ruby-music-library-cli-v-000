require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|s| s.save}
  end

  def add_song(song)
    if(song.artist.nil?)
      @songs << song # push current song to artist songs array
      song.artist=(self) unless song.artist == self #set songs artist property to instance of current artist
                                                    #unless it already exists
    end
  end

  def songs
    @songs
  end

  def genres # has many genres through songs
    self.songs.collect {|s| s.genre}.uniq
  end

  def self.list_artist_names
    sorted_array = self.all.sort_by! {|s| s.name}
    sorted_array.each_with_index do |item, index|
    number = index + 1 # add 1 to the array index for each name
    puts "#{number}. #{item.name}" #print the number and name
    end
  end

end
