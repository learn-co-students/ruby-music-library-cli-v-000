class Genre
  attr_accessor :name, :songs
  attr_accessor :name

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
end
