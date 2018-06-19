class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs, :artists

  @@all = [];

  def initialize(name)
    @name = name;
    @songs = [];
  end

  def self.all
    @@all;
  end

  def self.destroy_all
    @@all.clear;
  end

  def self.create(name)
    song = Genre.new(name);
    song.save;
    song;
  end

  def save
    @@all << self;
  end

  def songs
    @songs;
  end

  def artists
    @songs.map {|song| song.artist}.uniq;
  end
end
