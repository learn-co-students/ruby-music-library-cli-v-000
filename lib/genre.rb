class Genre

  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    self.name = name
    self.songs = []
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
    new_genre = Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def add_song(song)
    # binding.pry
    song.genre = self if song.genre == nil
    self.songs << song unless self.songs.include?(song) == true
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
