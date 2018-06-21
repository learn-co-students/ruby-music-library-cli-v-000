class Genre
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
  end

  def artists
    @songs.collect do |song_name|
      song_name.artist
    end
  end

  def self.find_by_name(genre_name)
      self.all.find do |genre_object|
        genre_object.name == genre_name
      end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
