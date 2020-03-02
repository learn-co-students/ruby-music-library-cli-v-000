class Genre

  extend Concerns::Findable

@@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
      @@all << self
  end

  def self.create(name)
    genre = self.all.detect {|gen| gen.name == name}
    if genre == nil
       genre = Genre.new(name)
       genre.save
     end
    return genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    var = self.songs.collect do |art|
      art.artist
    end
    var.uniq
  end

end
