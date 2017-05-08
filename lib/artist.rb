class Artist

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
    new_artist = Artist.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    # binding.pry
    song.artist = self if song.artist == nil
    self.songs << song unless self.songs.include?(song) == true
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


end
