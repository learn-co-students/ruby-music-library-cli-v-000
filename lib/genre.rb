class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song unless self.songs.include?(song)
  end

  def artists
      self.songs.collect{|song| song.artist}.uniq!
  end

  #def self.find_by_name(name)
    #self.all.detect{|obj| obj.name == name}
  #end

  #def self.find_or_create_by_name(name)
    #self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  #end

end
