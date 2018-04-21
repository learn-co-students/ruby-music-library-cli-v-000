class Genre

  attr_accessor :name
  attr_reader :songs
  @@all = []
  extend Concerns::Findable


  def initialize (name)
    @name = name
    @songs = []
  end

  def artists
    current_genre = self.songs
    current_genre.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end
end
