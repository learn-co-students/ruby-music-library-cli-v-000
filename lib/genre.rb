class Genre
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  # MEMORABLE

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    return genre
  end

end
