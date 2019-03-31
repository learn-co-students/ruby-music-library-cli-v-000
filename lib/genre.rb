class Genre
  attr_accessor :name, :songs
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
    self.class.all << self
  end

  def self.create(name)
    created_genre = Genre.new(name)
    created_genre.save
    created_genre
  end

  def artists #HAS MANY _ THROUGH _ -----create a place holder, collect the attribute value, ensure only unique objects are collected
    a = []
    self.songs.collect do |each_song|
      a << each_song.artist
    end
    a.uniq
  end

end
