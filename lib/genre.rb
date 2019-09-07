class Genre
  extend Concerns::Findable 
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def artists
    answer = []
    self.songs.each do |song_obj|
      answer << song_obj.artist unless answer.include?(song_obj.artist)
    end
    answer
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
end
